import express from 'express'
import jwt from '../library/jwt'
const router = express.Router()
import table from '../library/db'
import { check, validationResult } from 'express-validator'
import asyncHandler from 'express-async-handler'
const db = table("tickets")
/*
  ---
*/
function makeid(length) {
  var result           = '';
  var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for ( var i = 0; i < length; i++ ) {
     result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

router.post("/", [
  check("id_user").exists(),
  check("id_concert").exists()
], asyncHandler(async (req, res) => {
  let errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ status: false, err: errors.array() });
  }
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  let q = db.insert().set({
      id_user: req.body.id_user,
      id_concert: req.body.id_concert,
      code: makeid(5)
    }).build()
    let result = await db.query(q)
    res.json(result)
}))

router.post("/get", [
  check("id_concert").exists()
], asyncHandler(async (req, res) => {
  let errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ status: false, err: errors.array() });
  }
  let p = jwt.verify(jwt.getToken(req.headers.authorization)).results
  let q = db.select().where({
      id_user: p.id,
      id_concert: req.body.id_concert
    }).order("id", "Z").build()
    let result = await db.query(q)
    res.json(result)
}))

module.exports = router
