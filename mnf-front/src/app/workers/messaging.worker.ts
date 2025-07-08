// Messaging Web Worker
// This worker handles polling for new messages in the background

// Define the message types for communication with the main thread
interface WorkerMessage {
  type: string;
  payload?: any;
}

// Store the polling interval ID
let pollingIntervalId: number | null = null;
let conversationId: string | null = null;
let apiUrl: string = '';

// Handle messages from the main thread
self.addEventListener('message', (event: MessageEvent<WorkerMessage>) => {
  const { type, payload } = event.data;

  switch (type) {
    case 'START_POLLING':
      // Start polling for new conversations and messages
      startPolling(payload.intervalMs, payload.apiUrl);
      break;

    case 'STOP_POLLING':
      // Stop polling
      stopPolling();
      break;

    case 'SET_CONVERSATION':
      // Set the current conversation ID
      conversationId = payload.conversationId;
      break;

    default:
      console.error('Unknown message type:', type);
  }
});

// Function to start polling
function startPolling(intervalMs: number, url: string): void {
  // Stop any existing polling
  stopPolling();

  // Store the API URL
  apiUrl = url;

  // Start a new polling interval
  pollingIntervalId = self.setInterval(() => {
    // Fetch conversations
    fetchConversations();

    // If a conversation is selected, fetch its messages
    if (conversationId) {
      fetchMessages(conversationId);
    }
  }, intervalMs);

  // Immediately fetch data
  fetchConversations();
  if (conversationId) {
    fetchMessages(conversationId);
  }
}

// Function to stop polling
function stopPolling(): void {
  if (pollingIntervalId !== null) {
    self.clearInterval(pollingIntervalId);
    pollingIntervalId = null;
  }
}

// Function to fetch conversations
async function fetchConversations(): Promise<void> {
  try {
    // In a real implementation, this would use fetch to call the API
    // For now, we'll just post a message to the main thread to handle the mock data
    self.postMessage({
      type: 'FETCH_CONVERSATIONS'
    });
  } catch (error) {
    self.postMessage({
      type: 'ERROR',
      payload: {
        message: 'Error fetching conversations',
        error
      }
    });
  }
}

// Function to fetch messages for a conversation
async function fetchMessages(convId: string): Promise<void> {
  try {
    // In a real implementation, this would use fetch to call the API
    // For now, we'll just post a message to the main thread to handle the mock data
    self.postMessage({
      type: 'FETCH_MESSAGES',
      payload: {
        conversationId: convId
      }
    });
  } catch (error) {
    self.postMessage({
      type: 'ERROR',
      payload: {
        message: 'Error fetching messages',
        error
      }
    });
  }
}

// Export an empty object to make TypeScript happy with the module format
export {};
