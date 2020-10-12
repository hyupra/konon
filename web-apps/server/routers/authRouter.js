import express from 'express'
import jwt from '../library/jwt'
const router = express.Router()
import table from '../library/db'
import { check, validationResult } from 'express-validator'
import asyncHandler from 'express-async-handler'
import bcrypt from 'bcryptjs'
const db = table("users")
/*
  ---
*/
router.post("/register", [
  check("name").exists(),
  check("email").exists().isEmail(),
  check("password").exists(),
  check("birth").exists(),
  check("gender").exists().isIn(["1", "2"])
], asyncHandler(async (req, res) => {
  let errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ status: false, err: errors.array() });
  }
  let check = await db.query(db.select().select("id").where({email: req.body.email}).build())
  if (check.res.length == 0) {
    let q = db.insert().set({
      email: req.body.email,
      name: req.body.name,
      birth: req.body.birth,
      gender: req.body.gender,
      password: bcrypt.hashSync(req.body.password)
    }).build()
    let result = await db.query(q)
    res.json(result)
  }
  else {
    res.json({status: false, type:"mailExists"})
  }
}))

router.get("/check", asyncHandler(async (req, res) => {
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  let q = db.select().select("id").where({id: p.id}).build()
  let r = await db.query(q)
  res.json(r.res[0])
}))
  
router.post("/login", [
  check("email").exists(),
  check("password").exists()
], asyncHandler(async (req, res) => {
  let errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ status: false, err: errors.array() });
  }
  let q = db.select().select("id","password").where({email: req.body.email}).build()
  let checkUser = await db.query(q)
  let result = checkUser.res
  if (result.length > 0) {
    if (bcrypt.compareSync(req.body.password, result[0].password)) {
      res.json({status:true, type: result[0].status, token: jwt.sign({id: result[0].id})})
    }
    else {
      res.json({status: false})
    }
  }
  else {
    res.json({status: false})
  }
}))

module.exports = router
