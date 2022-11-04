var express = require('express');
const { createPool } = require('mysql');
var router = express.Router();
var pool = require("./pool");
var LocalStorage = require('node-localstorage').LocalStorage;
localStorage = new LocalStorage('./scratch');

router.get('/admin', function(req, res, next) {
    res.render('admin',{status:false,massage:''});
  });

  router.get('/adminlogout', function(req, res, next) {
    localStorage.removeItem('ADMIN')
    res.redirect('/login/admin');
  });

  router.post('/check_admin_login', function(req, res, next) {
    pool.query('select * from login_admin where (email=? or mobileno=?) and password=?',[req.body.email,req.body.email,req.body.password],function(error,result){
      if(error){
        res.render('admin',{massage:'server error........'});
      }
      else{
        if(result.length==1)
        {
          localStorage.setItem('ADMIN',JSON.stringify(result[0]))
          res.redirect('/bus/bus_desbord');
        }
        else{
          res.render('admin',{status:true,massage:'Invalid Email id/Mobli no./Password'})
        }
      }
    })
    
  });

module.exports = router;