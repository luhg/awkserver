#
# Error pages
#

function noop(query)
{
# This request has been handled.
# do nothing
}

function notFound()
{
    sendError("404", "you've come to the wong place")
    setResponseHeader("Content-Type", "text/html")
    setResponseBody("<html><head><title>fail</title></head><body>" \
                    "<p>Unable to find " getRequestEndpoint() " on this server.</p>" \
                    "<p>Try <a href='https://www.google.com?q=" urlEncode(getRequestEndpoint()) "'>google</a>" \
                    "</p></body></html>")
}

function badRequest()
{
    sendError("400", "wat?!")
    setResponseBody("Bad request")
}

function sendError(code, status)
{
    setResponseStatus(code " " status)
}

function redirect(location)
{
    setResponseHeader("Location", location)
    setResponseStatus("303 redirect")
}

