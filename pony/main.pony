use "http_server"
use "jennet"
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
    ctx.respond(StatusResponse(StatusOK), """{"status":"healthy"}""".array())
    consume ctx

class val MinimalResponder is Responder
  fun apply(res: Response, body: ByteArrays, ctx: Context box) =>
    ctx.session.send(res, body, ctx.request_id)
