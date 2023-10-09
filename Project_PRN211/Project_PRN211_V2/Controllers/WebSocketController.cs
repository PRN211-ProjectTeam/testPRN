using System.Net.WebSockets;
using Microsoft.AspNetCore.Mvc;

namespace Project_PRN211_V2.Controllers
{
	#region snippet_Controller_Connect
	public class WebSocketController : ControllerBase
	{
		// Store all active WebSocket connections
		private static readonly List<WebSocket> _sockets = new List<WebSocket>();

		[Route("/ws")]
		public async Task Get()
		{
			if (HttpContext.WebSockets.IsWebSocketRequest)
			{
				using var webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
				// Add the new WebSocket connection to the list of active connections
				_sockets.Add(webSocket);
				await Echo(webSocket);
			}
			else
			{
				HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
			}
		}
		#endregion

		private static async Task Echo(WebSocket webSocket)
		{
			var buffer = new byte[1024 * 4];
			var receiveResult = await webSocket.ReceiveAsync(
				new ArraySegment<byte>(buffer), CancellationToken.None);

			while (!receiveResult.CloseStatus.HasValue)
			{
				// Send the received data to all active connections
				foreach (var socket in _sockets)
				{
					await socket.SendAsync(
						new ArraySegment<byte>(buffer, 0, receiveResult.Count),
						receiveResult.MessageType,
						receiveResult.EndOfMessage,
						CancellationToken.None);
				}

				receiveResult = await webSocket.ReceiveAsync(
					new ArraySegment<byte>(buffer), CancellationToken.None);
			}

			// Remove the WebSocket connection from the list of active connections
			_sockets.Remove(webSocket);

			await webSocket.CloseAsync(
				receiveResult.CloseStatus.Value,
				receiveResult.CloseStatusDescription,
				CancellationToken.None);
		}
	}
}