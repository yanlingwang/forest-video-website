window.onload=function(){
      var container=document.getElementById('container');
      var list=document.getElementById('list');
      var prev=document.getElementById('prev');
      var next=document.getElementById('next');
      var timer;
      changeTab();
      function animate(offset){
        var newleft=parseInt(list.style.left)+offset;
        var time=300;
        var interval=10;
        var speed=offset/(time/interval);

        function go(){
          if((speed<0&&parseInt(list.style.left)>newleft)||
            (speed>0&&parseInt(list.style.left)<newleft)){
            list.style.left=parseInt(list.style.left)+speed+'px';
            setTimeout(go,interval);
          }
          else{
            list.style.left=newleft+'px';
                if(newleft>-1320){
                    list.style.left=-3960+'px';
                }
                if(newleft<-3960){
                    list.style.left=-1320+'px';
                }
          }
        }
        go();
      }
      function play(){
        timer=setInterval(function(){next.onclick();},20000);
      }
      function stop(){
        clearInterval(timer);
      }
      play();
      stop();
      next.onclick=function(){
          animate(-1320);
      }
      prev.onclick=function(){
          animate(1320);
      }
    container.onmouseover=stop;
    container.onmouseout=play;
   
}

/*视频类型选项卡切换效果*/
function changeTab(){
  var ali=document.getElementById('types').getElementsByTagName('li');
  var part1=document.getElementsByName('part1'); 
  var a=document.getElementsByName('a');
  ali[0].style.backgroundColor="white"; 
	a[0].style.color="black"; 

      //遍历types下的所有li   
  for(var i=0;i<ali.length;i++){
    ali[i].id=i;
    ali[i].onmouseover=function(){  
      for(var j=0;j<ali.length;j++) {
        if(j==this.id){
          part1[j].style.display="block";
          ali[j].style.backgroundColor="white"; 
		      a[j].style.color="black";      
        }
        else{
          part1[j].style.display="none";
          ali[j].style.backgroundColor="#669933";
		      a[j].style.color="white";   
        
        }
      }     
    }
   
  }
}
