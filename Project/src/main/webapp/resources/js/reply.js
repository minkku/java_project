console.log("Reply Module.....");

var replyService=(function(){

function add(content,callback,error){
console.log("reply.....");
console.log("update");
console.log("내용:"+content.content);

$.ajax({
type:'post',
url:'/replies/new',
data:JSON.stringify(content),
contentType:"application/json;charset=utf-8",
success:function(result,status,xhr){
if(callback){
callback(result);
}
},
error:function(xhr,status,er){
if(error){
error(er);
}
}
});
}


function updated(content,callback,error){
console.log("Content:" +content.reply_id);

$.ajax({
type:'put',
url:'/replies/'+content.reply_id,
data:JSON.stringify(content),
contentType:"application/json;charset=utf-8",
success:function(result,status,xhr){
if(callback){ 
callback(result);
}
},
error:function(xhr,status,er){
if(error){
error(er);
}
}
});
}

function getList(param,callback,error){
var books_id_id=param.books_id;
var page=param.page||1;

$.getJSON("/replies/pages/"+books_id_id+"/"+page+".json",
function(data){
console.log("Server Response:", data);
if(callback){
callback(data);
}
}).fail(function(xhr,status,err){
  console.error("AJAX Error:", status, err);
if(error){
error();
}
});
}

function remove(reply_id,callback,error){
$.ajax({
type:'delete',
url:'/replies/'+reply_id,
success:function(deleteResult,status,xhr){
if(callback){
callback(deleteResult);
}
},
error:function(xhr,status,er){
if(error){
error(er);
}
}
});
}



function get(reply_id,callback,error){
$.get("/replies/"+reply_id+".json",function(result){
if(callback){
callback(result);
}
}).fail(function(xhr,status,err){
if(error){
error();
}
});
}
	
   function displayTime(timeValue) {
      var today = new Date();
      var gap = today.getTime() - timeValue;
      var dateObj = new Date(timeValue);
      var str = "";
      
      if (gap < (1000 * 60 * 60 * 24)) {
         var hh = dateObj.getHours();
         var mi = dateObj.getMinutes();
         var ss = dateObj.getSeconds();
         
         return [ (hh > 9 ? '' : '0') + hh, ':', 
                (mi > 9 ? '' : '0') + mi, ':', 
                (ss > 9 ? '' : '0') + ss ].join('');
      } else {
         var yy = dateObj.getFullYear();
         var mm = dateObj.getMonth() + 1;
         var dd = dateObj.getDate();
         
         return [ yy, '/', (mm > 9 ? '' : '0')
               + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
      }
   };
   
  return {
        add: add,
        getList: getList,
        remove: remove,
        updated: updated,
        get: get,
        displayTime: displayTime
    };
})();