package LudumScript.Characters
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol363")]
   public class Player extends MovieClip
   {
      
      public var mc_JumpFoot_1:MovieClip;
      
      public var mc_Head_1:MovieClip;
      
      public var mc_JumpFoot_2:MovieClip;
      
      public var mc_LeftArm_2:MovieClip;
      
      public var mc_RightArm_Push_1:MovieClip;
      
      public var mc_RightArm_Push_2:MovieClip;
      
      public var mc_Head_Push_2:MovieClip;
      
      public var mc_Head_Push_1:MovieClip;
      
      public var mc_LeftArm_Push_1:MovieClip;
      
      public var mc_RightArm_2:MovieClip;
      
      public var mc_LeftArm_Push_2:MovieClip;
      
      public var mc_RightArm_1:MovieClip;
      
      public var mc_Foot_Push_2:MovieClip;
      
      public var mc_Foot_2:MovieClip;
      
      public var mc_LeftArm_1:MovieClip;
      
      public var mc_Foot_Push_1:MovieClip;
      
      public var mc_Foot_1:MovieClip;
      
      public var mc_Head_2:MovieClip;
      
      public var mc_Eye:MovieClip;
      
      public var bCollisionEnabled:Boolean = true;
      
      public var bMovementEnabled:Boolean = true;
      
      public var bAnimationEnabled:Boolean = true;
      
      public var bDoubleJumpEnabled:Boolean = true;
      
      public var nCriticalPush:Number = 4;
      
      public var nZeroGravityDiv:Number = 1.035;
      
      public var nZeroGravityHorzDiv:Number = 1.009;
      
      public var nGravHopStrength:Number = -3;
      
      public var nVertSpeed:Number = 0;
      
      public var nFallSpeed:Number = 0.55;
      
      public var nVertPush:Number = 2;
      
      public var nVertMax:Number = 19.6;
      
      public var nAirControlDiv:Number = 4;
      
      public var nHorzSpeed:Number = 0;
      
      public var nHorzMod:Number = 1;
      
      public var nHorzPush:Number = 1;
      
      public var nHorzMax:Number = 3.5;
      
      public var nCrouchSpeedDiv:Number = 2.5;
      
      public var bHitGround:Boolean = false;
      
      public var nJumpStrength:Number = -7.2;
      
      public var bInJump:Boolean = false;
      
      public var bDoubleJump:Boolean = false;
      
      public var bStompDown:Boolean = false;
      
      public var bLeftArmHit:Boolean = false;
      
      public var bLeftArmPush:Boolean = false;
      
      public var bRightArmHit:Boolean = false;
      
      public var bRightArmPush:Boolean = false;
      
      public var bHeadHit:Boolean = false;
      
      public var bHeadPush:Boolean = false;
      
      public var nEyeDestDefault:Number = 8;
      
      public var nEyeDestinationHorz:Number = this.nEyeDestDefault;
      
      public var nEyeMoveSpeedHorz:Number = 4;
      
      public var nEyeMoveSpeedVert:Number = 3.25;
      
      public var nEyeUpper:Number = -6;
      
      public var nEyeLower:Number = 2.5;
      
      public var nEyeDestinationVert:Number = this.nEyeUpper;
      
      public var nDeathFallSpeed:Number = 0;
      
      public var nDeathFallAmp:Number = 0.25;
      
      public var nDeathMoveSpeed:Number = 0.65;
      
      public var nDeathAlphaSpeed:Number = 0.05;
      
      public var nDeathRotationSpeed:Number = 3;
      
      public var nDeathTotalSpeedMod:Number = 1.5;
      
      public function Player()
      {
         super();
         addFrameScript(0,this.frame1,13,this.frame14,44,this.frame45);
         this.addEventListener(Event.ADDED_TO_STAGE,this.AddedOn);
      }
      
      private function AddedOn(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.AddedOn);
         this.mc_Eye.cacheAsBitmap = true;
         this.bDoubleJumpEnabled = MovieClip(root).bDoubleJumpActivated;
         MovieClip(root).DisableZeroGravity();
         this.addEventListener(Event.ENTER_FRAME,this.RunPlayer);
      }
      
      public function PlayerDeathAnim() : void
      {
         if(!MovieClip(root).mc_PlayerDeath1)
         {
            if(this.mc_Eye.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath1 = new PlayerDeath_R();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath1 = new PlayerDeath_L();
            }
            MovieClip(root).addChild(MovieClip(root).mc_PlayerDeath1);
            MovieClip(root).swapChildren(MovieClip(root).mc_PlayerDeath1,MovieClip(root).mc_Border);
            MovieClip(root).mc_PlayerDeath1.x = this.x;
            MovieClip(root).mc_PlayerDeath1.y = this.y;
            if(MovieClip(root).mc_PlayerDeath2)
            {
               MovieClip(root).mc_PlayerDeath2 = null;
            }
         }
         else if(!MovieClip(root).mc_PlayerDeath2)
         {
            if(this.mc_Eye.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath2 = new PlayerDeath_R();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath2 = new PlayerDeath_L();
            }
            MovieClip(root).addChild(MovieClip(root).mc_PlayerDeath2);
            MovieClip(root).swapChildren(MovieClip(root).mc_PlayerDeath2,MovieClip(root).mc_Border);
            MovieClip(root).mc_PlayerDeath2.x = this.x;
            MovieClip(root).mc_PlayerDeath2.y = this.y;
            if(MovieClip(root).mc_PlayerDeath3)
            {
               MovieClip(root).mc_PlayerDeath3 = null;
            }
         }
         else if(!MovieClip(root).mc_PlayerDeath3)
         {
            if(this.mc_Eye.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath3 = new PlayerDeath_R();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath3 = new PlayerDeath_L();
            }
            MovieClip(root).addChild(MovieClip(root).mc_PlayerDeath3);
            MovieClip(root).swapChildren(MovieClip(root).mc_PlayerDeath3,MovieClip(root).mc_Border);
            MovieClip(root).mc_PlayerDeath3.x = this.x;
            MovieClip(root).mc_PlayerDeath3.y = this.y;
            if(MovieClip(root).mc_PlayerDeath1)
            {
               MovieClip(root).mc_PlayerDeath1 = null;
            }
         }
         this.GC();
      }
      
      public function RunPlayer(param1:Event) : *
      {
         if(!MovieClip(root).bPaused && !MovieClip(root).bInDocument)
         {
            if(this.bCollisionEnabled)
            {
               if(MovieClip(root).mc_Level.hitTestPoint(this.x,this.y,true))
               {
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_1.x,this.y + this.mc_Foot_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_2.x,this.y + this.mc_Foot_2.y,true)))
                  {
                     if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_1.x,this.y + this.mc_Head_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_2.x,this.y + this.mc_Head_2.y,true)))
                     {
                        MovieClip(root).RespawnPlayer();
                        return;
                     }
                     this.y -= this.nCriticalPush;
                  }
                  else if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_1.x,this.y + this.mc_Head_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_2.x,this.y + this.mc_Head_2.y,true)))
                  {
                     this.y += this.nCriticalPush;
                  }
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_1.x,this.y + this.mc_Foot_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_2.x,this.y + this.mc_Foot_2.y,true)))
               {
                  this.bHitGround = true;
                  if(this.currentFrame >= 15)
                  {
                     this.gotoAndStop(1);
                     if(this.nVertSpeed > 6 && this.bAnimationEnabled)
                     {
                        this.mc_Eye.gotoAndPlay(150);
                     }
                  }
                  if(!MovieClip(root).bZeroGravity)
                  {
                     this.nVertSpeed = 0;
                  }
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_Push_1.x,this.y + this.mc_Foot_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_Push_2.x,this.y + this.mc_Foot_Push_2.y,true)))
                  {
                     this.nVertSpeed -= this.nVertPush;
                  }
               }
               else
               {
                  if(this.bHitGround)
                  {
                     this.bHitGround = false;
                     if(this.bAnimationEnabled && !MovieClip(root).bZeroGravity)
                     {
                        this.gotoAndPlay(15);
                     }
                  }
                  if(!MovieClip(root).bZeroGravity)
                  {
                     this.nVertSpeed += this.nFallSpeed;
                  }
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_JumpFoot_1.x,this.y + this.mc_JumpFoot_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_JumpFoot_2.x,this.y + this.mc_JumpFoot_2.y,true)))
               {
                  MovieClip(root).bDoubleJumpFailsafe = false;
                  MovieClip(root).bJumpReleased = false;
                  MovieClip(root).bGoDoubleJump = false;
                  MovieClip(root).bGravUsed = false;
                  this.bInJump = false;
                  this.bDoubleJump = false;
                  this.bStompDown = false;
                  MovieClip(root).bOnGround = true;
               }
               else
               {
                  MovieClip(root).bOnGround = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_1.x,this.y + this.mc_LeftArm_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_2.x,this.y + this.mc_LeftArm_2.y,true)))
               {
                  this.bLeftArmHit = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_Push_1.x,this.y + this.mc_LeftArm_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_Push_2.x,this.y + this.mc_LeftArm_Push_2.y,true)))
                  {
                     this.bLeftArmPush = true;
                  }
                  else
                  {
                     this.bLeftArmPush = false;
                  }
               }
               else
               {
                  this.bLeftArmHit = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_1.x,this.y + this.mc_RightArm_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_2.x,this.y + this.mc_RightArm_2.y,true)))
               {
                  this.bRightArmHit = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_Push_1.x,this.y + this.mc_RightArm_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_Push_2.x,this.y + this.mc_RightArm_Push_2.y,true)))
                  {
                     this.bRightArmPush = true;
                  }
                  else
                  {
                     this.bRightArmPush = false;
                  }
               }
               else
               {
                  this.bRightArmHit = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_1.x,this.y + this.mc_Head_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_2.x,this.y + this.mc_Head_2.y,true)))
               {
                  this.bHeadHit = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_Push_1.x,this.y + this.mc_Head_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_Push_2.x,this.y + this.mc_Head_Push_2.y,true)))
                  {
                     this.bHeadPush = true;
                  }
                  else
                  {
                     this.bHeadPush = false;
                  }
               }
               else
               {
                  this.bHeadHit = false;
               }
            }
            if(this.bMovementEnabled)
            {
               if(this.bHeadHit)
               {
                  if(this.nVertSpeed < 0)
                  {
                     this.nVertSpeed = 0;
                  }
                  if(this.bHeadPush)
                  {
                     this.nVertSpeed += this.nVertPush;
                  }
               }
               if(!MovieClip(root).bZeroGravity)
               {
                  if(MovieClip(root).bOnGround && MovieClip(root).bJumping && !this.bHeadHit && Boolean(MovieClip(root).bMovementInputEnabled))
                  {
                     this.bInJump = true;
                     if(this.bAnimationEnabled)
                     {
                        this.gotoAndStop(1);
                     }
                     if(MovieClip(root).bDown)
                     {
                        this.nVertSpeed = this.nJumpStrength / this.nCrouchSpeedDiv;
                     }
                     else
                     {
                        this.nVertSpeed = this.nJumpStrength;
                     }
                  }
                  if(this.bDoubleJumpEnabled && MovieClip(root).bMovementInputEnabled && !this.bDoubleJump && Boolean(MovieClip(root).bGoDoubleJump) && this.bHitGround == false)
                  {
                     this.bDoubleJump = true;
                     if(this.bAnimationEnabled)
                     {
                        this.gotoAndStop(1);
                     }
                     if(MovieClip(root).bDown)
                     {
                        this.nVertSpeed = this.nJumpStrength / this.nCrouchSpeedDiv;
                     }
                     else
                     {
                        this.nVertSpeed = this.nJumpStrength;
                     }
                  }
                  if(this.nVertSpeed > this.nVertMax)
                  {
                     this.nVertSpeed = this.nVertMax;
                  }
                  else if(this.nVertSpeed < this.nVertMax * -1)
                  {
                     this.nVertSpeed = this.nVertMax * -1;
                  }
               }
               else
               {
                  if(MovieClip(root).bMovementInputEnabled)
                  {
                     if(MovieClip(root).bJumping)
                     {
                        this.nVertSpeed -= this.nHorzMod / this.nAirControlDiv;
                     }
                     else if(MovieClip(root).bDown)
                     {
                        this.nVertSpeed += this.nHorzMod / this.nAirControlDiv;
                     }
                  }
                  if(!MovieClip(root).bJumping && !MovieClip(root).bDown || MovieClip(root).bJumping && MovieClip(root).bDown || !MovieClip(root).bMovementInputEnabled)
                  {
                     this.nVertSpeed /= this.nZeroGravityDiv;
                  }
                  if(this.bHitGround)
                  {
                     if(this.nVertSpeed > 0)
                     {
                        this.nVertSpeed = 0;
                     }
                     else
                     {
                        this.nVertSpeed -= this.nVertPush;
                     }
                  }
               }
               if(this.nVertSpeed < 0.1 && this.nVertSpeed > -0.1 && this.nVertSpeed != 0)
               {
                  this.nVertSpeed = 0;
               }
               if(this.bInJump && Boolean(MovieClip(root).bDown))
               {
                  if(MovieClip(root).bMovementInputEnabled)
                  {
                     if(this.nVertSpeed < 0)
                     {
                        this.nVertSpeed = 0;
                     }
                     else
                     {
                        this.bStompDown = true;
                        this.y += this.nVertSpeed * 2;
                     }
                  }
               }
               else
               {
                  this.y += this.nVertSpeed;
               }
               if(MovieClip(root).bMovementInputEnabled)
               {
                  if(MovieClip(root).bOnGround)
                  {
                     if(MovieClip(root).bMoveLeft)
                     {
                        this.nHorzSpeed -= this.nHorzMod;
                     }
                     if(MovieClip(root).bMoveRight)
                     {
                        this.nHorzSpeed += this.nHorzMod;
                     }
                  }
                  else
                  {
                     if(MovieClip(root).bMoveLeft)
                     {
                        this.nHorzSpeed -= this.nHorzMod / this.nAirControlDiv;
                     }
                     if(MovieClip(root).bMoveRight)
                     {
                        this.nHorzSpeed += this.nHorzMod / this.nAirControlDiv;
                     }
                  }
               }
               if(!(this.bLeftArmHit && this.bRightArmHit))
               {
                  if(this.bLeftArmHit)
                  {
                     if(this.nHorzSpeed < 0)
                     {
                        this.nHorzSpeed = 0;
                     }
                     if(this.bLeftArmPush && !MovieClip(root).bZeroGravity)
                     {
                        this.nHorzSpeed = this.nHorzPush;
                     }
                  }
                  if(this.bRightArmHit)
                  {
                     if(this.nHorzSpeed > 0)
                     {
                        this.nHorzSpeed = 0;
                     }
                     if(this.bLeftArmPush && !MovieClip(root).bZeroGravity)
                     {
                        this.nHorzSpeed = this.nHorzPush * -1;
                     }
                  }
               }
               if(MovieClip(root).bZeroGravity)
               {
                  this.nHorzSpeed /= this.nZeroGravityHorzDiv;
               }
               else
               {
                  if(!MovieClip(root).bMoveLeft && !MovieClip(root).bMoveRight || Boolean(MovieClip(root).bMoveLeft) && Boolean(MovieClip(root).bMoveRight))
                  {
                     if(this.nHorzSpeed < 0 - this.nHorzMod)
                     {
                        this.nHorzSpeed += this.nHorzMod;
                     }
                     else if(this.nHorzSpeed > 0 + this.nHorzMod)
                     {
                        this.nHorzSpeed -= this.nHorzMod;
                     }
                     else
                     {
                        this.nHorzSpeed = 0;
                     }
                  }
                  if(this.nHorzSpeed > this.nHorzMax)
                  {
                     this.nHorzSpeed = this.nHorzMax;
                  }
                  else if(this.nHorzSpeed < this.nHorzMax * -1)
                  {
                     this.nHorzSpeed = this.nHorzMax * -1;
                  }
               }
               if(this.nHorzSpeed < 0.1 && this.nHorzSpeed > -0.1 && this.nHorzSpeed != 0)
               {
                  this.nHorzSpeed = 0;
               }
               if(Boolean(MovieClip(root).bOnGround) && Boolean(MovieClip(root).bDown))
               {
                  this.x += this.nHorzSpeed / this.nCrouchSpeedDiv;
               }
               else
               {
                  this.x += this.nHorzSpeed;
               }
            }
            if(this.bAnimationEnabled)
            {
               if(this.nHorzSpeed > 0)
               {
                  this.nEyeDestinationHorz = this.nEyeDestDefault;
               }
               else if(this.nHorzSpeed < 0)
               {
                  this.nEyeDestinationHorz = this.nEyeDestDefault * -1;
               }
               if(this.mc_Eye.x < this.nEyeDestinationHorz - this.nEyeMoveSpeedHorz)
               {
                  this.mc_Eye.x += this.nEyeMoveSpeedHorz;
               }
               else if(this.mc_Eye.x > this.nEyeDestinationHorz + this.nEyeMoveSpeedHorz)
               {
                  this.mc_Eye.x -= this.nEyeMoveSpeedHorz;
               }
               else
               {
                  this.mc_Eye.x = this.nEyeDestinationHorz;
               }
               if(MovieClip(root).bMovementInputEnabled)
               {
                  if(MovieClip(root).bDown)
                  {
                     this.nEyeDestinationVert = this.nEyeLower;
                  }
                  else
                  {
                     this.nEyeDestinationVert = this.nEyeUpper;
                  }
                  if(this.mc_Eye.y < this.nEyeDestinationVert - this.nEyeMoveSpeedVert)
                  {
                     this.mc_Eye.y += this.nEyeMoveSpeedVert;
                  }
                  else if(this.mc_Eye.y > this.nEyeDestinationVert + this.nEyeMoveSpeedVert)
                  {
                     this.mc_Eye.y -= this.nEyeMoveSpeedVert;
                  }
                  else
                  {
                     this.mc_Eye.y = this.nEyeDestinationVert;
                  }
               }
               if(MovieClip(root).bZeroGravity)
               {
                  this.gotoAndStop(1);
               }
            }
         }
      }
      
      public function GravHop() : void
      {
         if(this.nVertSpeed > this.nGravHopStrength)
         {
            this.nVertSpeed += this.nGravHopStrength;
         }
      }
      
      public function GC() : void
      {
         if(this.parent)
         {
            this.removeEventListener(Event.ENTER_FRAME,this.RunPlayer);
            this.parent.removeChild(this);
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame14() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         stop();
      }
   }
}


