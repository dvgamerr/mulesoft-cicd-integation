%dw 2.0
output application/json
---
{
  timestamp: now() as String {format:"yyyy-MM-dd'T'HH:mm:ss'Z'"},
  status: 500,
  message: error.detailedDescription default error.errorType.identifier,
  error: error.failingComponent default error.errorType.identifier,
}