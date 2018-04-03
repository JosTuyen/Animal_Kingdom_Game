"use strict";

//Utility module 
var Util = {
    seed : Math.random(),     //not ideal since not private
            
    random : function (newSeed){   //[0 - 1.0)  optional seeding     
        if(newSeed) Util.seed = newSeed;        
        
        Util.seed = (Util.seed*9301 + 49297) % 233280;
        var ret = Util.seed/233280;
        if(ret>=1) ret = .99999;  //maybe rounding error?
        return ret;
    },
     
    drawRotatedImage: function (ctx,theta,image,x,y,wid,ht){
    //using but not changing context ctx, draws image with its ulc at x,y,
    // rotated theta radians cw about its center
        var xcen = x+wid/2, ycen = y+ht/2;
        ctx.save(); 
        ctx.translate(xcen,ycen); ctx.rotate(theta); ctx.translate(-xcen,-ycen);        
        ctx.drawImage(image,x,y, wid,ht);
        ctx.restore();
    }
};
    