%dw 2.0
output application/json
---
{
  timestamp: now() as String {format:"yyyy-MM-dd'T'HH:mm:ss'Z'"},
  status: 415,
  error: error.errorType.identifier,
  message: error.errorMessage.message default error.description
}