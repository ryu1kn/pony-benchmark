use "http_server"
use "jennet"
use "json"
use "valbytes"

actor Main
  new create(env: Env) =>
    let auth =
      try
        env.root as AmbientAuth
      else
        env.out.print("unable to use network.")
        return
      end

    let server =
      Jennet(auth, env.out, MinimalResponder)
        .> get("/health", H)
        .serve(ServerConfig(where port' = "8080"))

    if server is None then env.out.print("bad routes!") end

primitive H is RequestHandler
  fun apply(ctx: Context): Context iso^ =>
    let doc = JsonDoc
    let obj = JsonObject
    obj.data("status") = "healthy"
    doc.data = obj
    ctx.respond(StatusResponse(StatusOK), doc.string().array())
    consume ctx

class val MinimalResponder is Responder
  fun apply(res: Response, body: ByteArrays, ctx: Context box) =>
    ctx.session.send(res, body, ctx.request_id)
