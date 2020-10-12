import jwt from 'jsonwebtoken'

var methods
methods = {
  results: '',
  getToken: (headerAuth) => {
    if (!headerAuth) throw new Error("undefined token in headers")
    let token = headerAuth.split("Bearer ")
    return token[1]
  },
  sign: (payload) => {
    return jwt.sign(payload, process.env.JWT_SECRET, {
      expiresIn: process.env.JWT_EXP
    })
  },
  verify: (token) => {
    methods.results = jwt.verify(token, process.env.JWT_SECRET)
    return methods
  },
  where: (rule) => {
    var results = methods.results, safe = []
    for (var ruleKey in rule) {
      if (results[ruleKey]) {
        if (results[ruleKey] === rule[ruleKey]) safe.push(true)
        else safe.push(false)
      }
      else{
        throw new Error(`Can\'t find "${ruleKey}" in JWT results. Check your JWT results: jwt.verify(token).results`)
      }
    }
    if (safe.includes(false)) {
      let error = new Error("You doesn't have access to this API")
      error.name="JsonWebTokenError"
      throw error
    }
  }
}

export default methods
