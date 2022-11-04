var express = require("express");
var router = express.Router();
var pool = require("./pool");
var upload = require("./multer");
var LocalStorage = require('node-localstorage').LocalStorage;
localStorage = new LocalStorage('./scratch');

router.get("/fetch_all_bustype", function (req, res, next) {
  pool.query("select * from bustype", function (error, result) {
    if (error) {
      console.log(error);
      alert("data"); 
      res.status(500).json([]);
    } else {
      res.status(200).json({ busmodal: result });
      
    }
  });
});

// ///////////fetch rent/////////////
router.get("/fetch_rent",function(req,res,next){
  pool.query("select rent from bustype where typeid=?",[req.query.typeid],function(error,result){
    if (error) {
      res.status(500).json([]);    
    } else {
      res.status(200).json({ rent: result });
    }
  });
});
/////////////////////////////


router.get("/fetch_all_states", function (req, res, next) {
  pool.query("select * from states", function (error, result) {
    if (error) {
      res.status(500).json([]);
    } else {
      res.status(200).json({ state: result });
    }
  });
});

router.get("/fetch_all_cities", function (req, res, next) {
  pool.query("select * from cities where stateid=?",[req.query.stateid],function (error, result){
      if (error) {
        res.status(500).json([]);    
      } else {
        res.status(200).json({ city: result });
      }
    });
});

router.get("/bus", function (req, res, next) {
  try{
    var admin = localStorage.getItem('ADMIN')
    if(admin==null){
      res.redirect('/login/admin');
    }
    res.render("businterface", { massage: "" });
  }
  catch(e){
    res.redirect('/login/admin');
  }
});

router.get("/bus_desbord",function(req,res,next){
  var query=('select count(*) as counttypeid from bustype;select count(*) as countstate from states;select count(*) as countcity from cities');
  pool.query(query,function(error,result){
    if(error){
      console.log(error);
      res.render("deshbord",{massage:'surver error......',result:[]});
    }
    else{
      console.log(error);
      var admin =JSON.parse(localStorage.getItem('ADMIN'));

      res.render('deshbord',{massage:'get result',result:result,admin:admin});
    }
  })
  
});

// router.get("/bus_desbord",function(req,res,next){
//   pool.query('select name from login_admin where email=? or mobileno=?',[req.query.email,req.query.email],function(error,result){
    
//   })
// });

router.post("/submited", upload.any('picture'),function (req, res, next) {
  console.log("COLOR:",req.body.day);
  pool.query(
    "insert into bus (bustype,sstate,scity,dstate,dcity,kilometer,rent,busnumber,day,picture) values(?,?,?,?,?,?,?,?,?,?)",
    [
      req.body.bustype,
      req.body.sstate,
      req.body.scity,
      req.body.dstate,
      req.body.dcity,
      req.body.kilometer,
      req.body.rent,
      req.body.busnumber,
      JSON.stringify(req.body.day),
      req.files[0].filename,
    ],
    function (error, result) {
      if (error) {
        console.log("Error:", error);
        res.render("businterface", { massage: "server Error ...." });
      } else {
        console.log("Result:", result);
        res.render("businterface", { massage: "Record Submitted ...." });
      }
    }
  );
});

router.get("/display_all_data",function(req,res,next){
  pool.query('select B.*,(select T.busmodal from bustype T where T.typeid=B.bustype) as modalname,(select S.statename from states S where S.stateid=B.sstate)as sourcestate,(select S.statename from states S where S.stateid=B.dstate)as destinationstate,(select C.cityname from cities C where C.cityid=B.scity)as sourcecity,(select C.cityname from cities C where C.cityid=B.dcity)as destinationcity from bus B',function(error,result){

    if(error){
      res.render('displayalldata',{status:false,error:'server error........'})
    }
    else{
      if(result.length==0){
        res.render('displayalldata',{status:true,data:'No record found........'}) 
      }
      else{
        try{
          var admin =localStorage.getItem('ADMIN')
          if(admin==null){
            res.redirect("/login/admin")
          }
          res.render('displayalldata',{status:true,data:result})
        }
        catch(e){
          res.redirect("/login/admin")
        }
        
      }
      
    }
  });
  
});


router.get("/savebusdata",function (req, res, next) {
  console.log("COLOR:",req.body.day);
  var days = JSON.stringify(req.query.day)
  pool.query(
    "update bus set bustype=?,sstate=?,scity=?,dstate=?,dcity=?,kilometer=?,rent=?,busnumber=?,day=? where busid=?",
    [
      
      req.query.bustype,
      req.query.sstate,
      req.query.scity,
      req.query.dstate,
      req.query.dcity,
      req.query.kilometer,
      req.query.rent,
      req.query.busnumber,
      days,
      req.query.busid,
      ],
    function (error, result) {
      if (error) {
        console.log("Error:", error);
        res.status(500).json({ status:false,massage: "server Error ...." });
      } else {
        console.log("Result:", result);
        res.status(200).json({status:true, massage: "Edit Record Successfully ...." });
      }
    }
  );
});

router.get("/deletebusdata",function (req, res, next) {
  console.log("COLOR:",req.body.day);
  pool.query(
    "delete from bus where  busid=?",
    [
      req.query.busid,
      
    ],
    function (error, result) {
      if (error) {
        console.log("Error:", error);
        res.status(500).json({ status:false,massage: "server Error ...." });
      } else {
        console.log("Result:", result);
        res.status(200).json({status:true, massage: "Delete Record Successfully ...." });
      }
    }
  );
});

router.post("/uplode_picture", upload.any('picture'),function (req, res, next) {
  // console.log("COLOR:",req.body.day);
  pool.query(
    "update bus set picture=? where busid=?",
    [
      req.files[0].filename,
      req.body.busid,
    ],
    function (error, result) {
      if (error) {
        console.log("Error:", error);
        res.status(500).json({ status:false,massage: "server Error ...." });
      } else {
        console.log("Result:", result);
        res.status(200).json({status:true ,massage: "Record Submitted ...." });
      }
    }
  );
});

module.exports = router;
