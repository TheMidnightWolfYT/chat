-- Create or connect to the SQLite database file
-- Replace "system.db" with your desired database name
ATTACH DATABASE 'system.db' AS chat_system;

-- Check if the chat_system database already exists; if not, create it
CREATE TABLE IF NOT EXISTS chat_system.messages (
    message_id INTEGER PRIMARY KEY,
    message_text TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample messages (replace with actual chat messages)
INSERT INTO chat_system.messages (message_text) VALUES
    ('Hello, everyone!'),
    ('This is a simple chat system with no user names.'),
    ('Feel free to chat here.');

-- Query to retrieve all messages in the general chat
SELECT timestamp, message_text
FROM chat_system.messages;