import std/[assertions, httpclient]
import src/client

const
  url = "https:// ???  .supabase.co"
  key = ""

proc main =
  let cliente = newSyncFunctionsClient(url, key)
  defer: cliente.close
  assert cliente is SyncFunctionsClient

  let respuesta = cliente.invoke(
    functionName="hello-world", body = "test",
    responseType = SFResponseType.Json, region = SFRegion.Any)
  assert respuesta is Response
  echo respuesta.repr


when  isMainModule:
  main()
