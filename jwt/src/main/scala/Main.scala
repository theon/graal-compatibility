import pdi.jwt.{Jwt, JwtAlgorithm, JwtHeader, JwtClaim, JwtOptions}

object Main {
  def main(args: Array[String]) = {
    println("Jwt.. ")

    val token = Jwt.encode("""{"user":1}""", "secretKey", JwtAlgorithm.HS256)
    val result = Jwt.decodeRawAll(token, "secretKey", Seq(JwtAlgorithm.HS256)).isSuccess

    println(result)
  }
}

