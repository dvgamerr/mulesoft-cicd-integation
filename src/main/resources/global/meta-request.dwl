%dw 2.0
output application/json

var uuidGenerate = uuid()
---
{
	uuid: uuidGenerate,
	method: attributes.method,
	path: attributes.rawRequestPath,
	headers: { "x-uuid": uuidGenerate },
	query: attributes.queryParams,
	params: attributes.uriParams,
	body: payload,
}