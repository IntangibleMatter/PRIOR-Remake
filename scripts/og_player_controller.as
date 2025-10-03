package §_-33§
{
   import flash.display.MovieClip;
   import flash.events.Event;

   [Embed(source="/_assets/assets.swf", symbol="symbol368")]
   public class §_-60§ extends MovieClip
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

      public var §_-5V§:MovieClip;

      public var §_-5F§:Boolean = true;

      public var §else§:Boolean = true;

      public var §_-8§:Boolean = true;

      public var §_-5x§:Boolean = true;

      public var §_-6I§:Number = 4;

      public var static:Number = 1.035;

      public var §_-2Y§:Number = 1.009;

      public var §_-3z§:Number = -3;

      public var §_-17§:Number = 0;

      public var §_-2-§:Number = 0.55;

      public var §_-0j§:Number = 2;

      public var §_-3y§:Number = 19.6;

      public var §_-1J§:Number = 4;

      public var §_-4m§:Number = 0;

      public var §_-23§:Number = 1;

      public var §_-3G§:Number = 1;

      public var §_-5v§:Number = 3.5;

      public var §_-0T§:Number = 2.5;

      public var §_-6R§:Boolean = false;

      public var §_-6p§:Number = -7.2;

      public var §_-64§:Boolean = false;

      public var §_-1I§:Boolean = false;

      public var §_-2t§:Boolean = false;

      public var §_-04§:Boolean = false;

      public var §true§:Boolean = false;

      public var §_-5K§:Boolean = false;

      public var §_-4i§:Boolean = false;

      public var §_-4y§:Boolean = false;

      public var §_-0V§:Boolean = false;

      public var §_-5§:Number = 8;

      public var §_-3i§:Number = this.§_-5§;

      public var final:Number = 4;

      public var §_-34§:Number = 3.25;

      public var §_-i§:Number = -6;

      public var §_-2k§:Number = 2.5;

      public var §_-02§:Number = this.§_-i§;

      public var §in §:Number = 0;

      public var §_-40§:Number = 0.25;

      public var § do§:Number = 0.65;

      public var §_-C§:Number = 0.05;

      public var §_-5E§:Number = 3;

      public var §_-2w§:Number = 1.5;

      public function §_-60§()
      {
         super();
         addFrameScript(0,this.frame1,13,this.frame14,44,this.frame45);
         this.addEventListener(Event.ADDED_TO_STAGE,this.§_-5X§);
      }

      private function §_-5X§(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-5X§);
         this.§_-5V§.cacheAsBitmap = true;
         this.§_-5x§ = MovieClip(root).bDoubleJumpActivated;
         MovieClip(root).DisableZeroGravity();
         this.addEventListener(Event.ENTER_FRAME,this.§_-5G§);
      }

      public function §_-0r§() : void
      {
         if(!MovieClip(root).mc_PlayerDeath1)
         {
            if(this.§_-5V§.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath1 = new §_-§();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath1 = new §_-1g§();
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
            if(this.§_-5V§.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath2 = new §_-§();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath2 = new §_-1g§();
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
            if(this.§_-5V§.x >= 0)
            {
               MovieClip(root).mc_PlayerDeath3 = new §_-§();
            }
            else
            {
               MovieClip(root).mc_PlayerDeath3 = new §_-1g§();
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
         this.§_-6E§();
      }

      public function §_-5G§(param1:Event) : *
      {
         if(!MovieClip(root).bPaused && !MovieClip(root).bInDocument)
         {
            if(this.§_-5F§)
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
                     this.y -= this.§_-6I§;
                  }
                  else if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_1.x,this.y + this.mc_Head_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_2.x,this.y + this.mc_Head_2.y,true)))
                  {
                     this.y += this.§_-6I§;
                  }
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_1.x,this.y + this.mc_Foot_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_2.x,this.y + this.mc_Foot_2.y,true)))
               {
                  this.§_-6R§ = true;
                  if(this.currentFrame >= 15)
                  {
                     this.gotoAndStop(1);
                     if(this.§_-17§ > 6 && this.§_-8§)
                     {
                        this.§_-5V§.gotoAndPlay(150);
                     }
                  }
                  if(!MovieClip(root).bZeroGravity)
                  {
                     this.§_-17§ = 0;
                  }
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_Push_1.x,this.y + this.mc_Foot_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Foot_Push_2.x,this.y + this.mc_Foot_Push_2.y,true)))
                  {
                     this.§_-17§ -= this.§_-0j§;
                  }
               }
               else
               {
                  if(this.§_-6R§)
                  {
                     this.§_-6R§ = false;
                     if(this.§_-8§ && !MovieClip(root).bZeroGravity)
                     {
                        this.gotoAndPlay(15);
                     }
                  }
                  if(!MovieClip(root).bZeroGravity)
                  {
                     this.§_-17§ += this.§_-2-§;
                  }
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_JumpFoot_1.x,this.y + this.mc_JumpFoot_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_JumpFoot_2.x,this.y + this.mc_JumpFoot_2.y,true)))
               {
                  MovieClip(root).bDoubleJumpFailsafe = false;
                  MovieClip(root).bJumpReleased = false;
                  MovieClip(root).bGoDoubleJump = false;
                  MovieClip(root).bGravUsed = false;
                  this.§_-64§ = false;
                  this.§_-1I§ = false;
                  this.§_-2t§ = false;
                  MovieClip(root).bOnGround = true;
               }
               else
               {
                  MovieClip(root).bOnGround = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_1.x,this.y + this.mc_LeftArm_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_2.x,this.y + this.mc_LeftArm_2.y,true)))
               {
                  this.§_-04§ = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_Push_1.x,this.y + this.mc_LeftArm_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_LeftArm_Push_2.x,this.y + this.mc_LeftArm_Push_2.y,true)))
                  {
                     this.§true§ = true;
                  }
                  else
                  {
                     this.§true§ = false;
                  }
               }
               else
               {
                  this.§_-04§ = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_1.x,this.y + this.mc_RightArm_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_2.x,this.y + this.mc_RightArm_2.y,true)))
               {
                  this.§_-5K§ = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_Push_1.x,this.y + this.mc_RightArm_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_RightArm_Push_2.x,this.y + this.mc_RightArm_Push_2.y,true)))
                  {
                     this.§_-4i§ = true;
                  }
                  else
                  {
                     this.§_-4i§ = false;
                  }
               }
               else
               {
                  this.§_-5K§ = false;
               }
               if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_1.x,this.y + this.mc_Head_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_2.x,this.y + this.mc_Head_2.y,true)))
               {
                  this.§_-4y§ = true;
                  if(Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_Push_1.x,this.y + this.mc_Head_Push_1.y,true)) || Boolean(MovieClip(root).mc_Level.hitTestPoint(this.x + this.mc_Head_Push_2.x,this.y + this.mc_Head_Push_2.y,true)))
                  {
                     this.§_-0V§ = true;
                  }
                  else
                  {
                     this.§_-0V§ = false;
                  }
               }
               else
               {
                  this.§_-4y§ = false;
               }
            }
            if(this.§else§)
            {
               if(this.§_-4y§)
               {
                  if(this.§_-17§ < 0)
                  {
                     this.§_-17§ = 0;
                  }
                  if(this.§_-0V§)
                  {
                     this.§_-17§ += this.§_-0j§;
                  }
               }
               if(!MovieClip(root).bZeroGravity)
               {
                  if(MovieClip(root).bOnGround && MovieClip(root).bJumping && !this.§_-4y§ && Boolean(MovieClip(root).bMovementInputEnabled))
                  {
                     this.§_-64§ = true;
                     if(this.§_-8§)
                     {
                        this.gotoAndStop(1);
                     }
                     if(MovieClip(root).bDown)
                     {
                        this.§_-17§ = this.§_-6p§ / this.§_-0T§;
                     }
                     else
                     {
                        this.§_-17§ = this.§_-6p§;
                     }
                  }
                  if(this.§_-5x§ && MovieClip(root).bMovementInputEnabled && !this.§_-1I§ && Boolean(MovieClip(root).bGoDoubleJump) && this.§_-6R§ == false)
                  {
                     this.§_-1I§ = true;
                     if(this.§_-8§)
                     {
                        this.gotoAndStop(1);
                     }
                     if(MovieClip(root).bDown)
                     {
                        this.§_-17§ = this.§_-6p§ / this.§_-0T§;
                     }
                     else
                     {
                        this.§_-17§ = this.§_-6p§;
                     }
                  }
                  if(this.§_-17§ > this.§_-3y§)
                  {
                     this.§_-17§ = this.§_-3y§;
                  }
                  else if(this.§_-17§ < this.§_-3y§ * -1)
                  {
                     this.§_-17§ = this.§_-3y§ * -1;
                  }
               }
               else
               {
                  if(MovieClip(root).bMovementInputEnabled)
                  {
                     if(MovieClip(root).bJumping)
                     {
                        this.§_-17§ -= this.§_-23§ / this.§_-1J§;
                     }
                     else if(MovieClip(root).bDown)
                     {
                        this.§_-17§ += this.§_-23§ / this.§_-1J§;
                     }
                  }
                  if(!MovieClip(root).bJumping && !MovieClip(root).bDown || MovieClip(root).bJumping && MovieClip(root).bDown || !MovieClip(root).bMovementInputEnabled)
                  {
                     this.§_-17§ /= this.static;
                  }
                  if(this.§_-6R§)
                  {
                     if(this.§_-17§ > 0)
                     {
                        this.§_-17§ = 0;
                     }
                     else
                     {
                        this.§_-17§ -= this.§_-0j§;
                     }
                  }
               }
               if(this.§_-17§ < 0.1 && this.§_-17§ > -0.1 && this.§_-17§ != 0)
               {
                  this.§_-17§ = 0;
               }
               if(this.§_-64§ && Boolean(MovieClip(root).bDown))
               {
                  if(MovieClip(root).bMovementInputEnabled)
                  {
                     if(this.§_-17§ < 0)
                     {
                        this.§_-17§ = 0;
                     }
                     else
                     {
                        this.§_-2t§ = true;
                        this.y += this.§_-17§ * 2;
                     }
                  }
               }
               else
               {
                  this.y += this.§_-17§;
               }
               if(MovieClip(root).bMovementInputEnabled)
               {
                  if(MovieClip(root).bOnGround)
                  {
                     if(MovieClip(root).bMoveLeft)
                     {
                        this.§_-4m§ -= this.§_-23§;
                     }
                     if(MovieClip(root).bMoveRight)
                     {
                        this.§_-4m§ += this.§_-23§;
                     }
                  }
                  else
                  {
                     if(MovieClip(root).bMoveLeft)
                     {
                        this.§_-4m§ -= this.§_-23§ / this.§_-1J§;
                     }
                     if(MovieClip(root).bMoveRight)
                     {
                        this.§_-4m§ += this.§_-23§ / this.§_-1J§;
                     }
                  }
               }
               if(!(this.§_-04§ && this.§_-5K§))
               {
                  if(this.§_-04§)
                  {
                     if(this.§_-4m§ < 0)
                     {
                        this.§_-4m§ = 0;
                     }
                     if(this.§true§ && !MovieClip(root).bZeroGravity)
                     {
                        this.§_-4m§ = this.§_-3G§;
                     }
                  }
                  if(this.§_-5K§)
                  {
                     if(this.§_-4m§ > 0)
                     {
                        this.§_-4m§ = 0;
                     }
                     if(this.§true§ && !MovieClip(root).bZeroGravity)
                     {
                        this.§_-4m§ = this.§_-3G§ * -1;
                     }
                  }
               }
               if(MovieClip(root).bZeroGravity)
               {
                  this.§_-4m§ /= this.§_-2Y§;
               }
               else
               {
                  if(!MovieClip(root).bMoveLeft && !MovieClip(root).bMoveRight || Boolean(MovieClip(root).bMoveLeft) && Boolean(MovieClip(root).bMoveRight))
                  {
                     if(this.§_-4m§ < 0 - this.§_-23§)
                     {
                        this.§_-4m§ += this.§_-23§;
                     }
                     else if(this.§_-4m§ > 0 + this.§_-23§)
                     {
                        this.§_-4m§ -= this.§_-23§;
                     }
                     else
                     {
                        this.§_-4m§ = 0;
                     }
                  }
                  if(this.§_-4m§ > this.§_-5v§)
                  {
                     this.§_-4m§ = this.§_-5v§;
                  }
                  else if(this.§_-4m§ < this.§_-5v§ * -1)
                  {
                     this.§_-4m§ = this.§_-5v§ * -1;
                  }
               }
               if(this.§_-4m§ < 0.1 && this.§_-4m§ > -0.1 && this.§_-4m§ != 0)
               {
                  this.§_-4m§ = 0;
               }
               if(Boolean(MovieClip(root).bOnGround) && Boolean(MovieClip(root).bDown))
               {
                  this.x += this.§_-4m§ / this.§_-0T§;
               }
               else
               {
                  this.x += this.§_-4m§;
               }
            }
            if(this.§_-8§)
            {
               if(this.§_-4m§ > 0)
               {
                  this.§_-3i§ = this.§_-5§;
               }
               else if(this.§_-4m§ < 0)
               {
                  this.§_-3i§ = this.§_-5§ * -1;
               }
               if(this.§_-5V§.x < this.§_-3i§ - this.final)
               {
                  this.§_-5V§.x += this.final;
               }
               else if(this.§_-5V§.x > this.§_-3i§ + this.final)
               {
                  this.§_-5V§.x -= this.final;
               }
               else
               {
                  this.§_-5V§.x = this.§_-3i§;
               }
               if(MovieClip(root).bMovementInputEnabled)
               {
                  if(MovieClip(root).bDown)
                  {
                     this.§_-02§ = this.§_-2k§;
                  }
                  else
                  {
                     this.§_-02§ = this.§_-i§;
                  }
                  if(this.§_-5V§.y < this.§_-02§ - this.§_-34§)
                  {
                     this.§_-5V§.y += this.§_-34§;
                  }
                  else if(this.§_-5V§.y > this.§_-02§ + this.§_-34§)
                  {
                     this.§_-5V§.y -= this.§_-34§;
                  }
                  else
                  {
                     this.§_-5V§.y = this.§_-02§;
                  }
               }
               if(MovieClip(root).bZeroGravity)
               {
                  this.gotoAndStop(1);
               }
            }
         }
      }

      public function §_-1w§() : void
      {
         if(this.§_-17§ > this.§_-3z§)
         {
            this.§_-17§ += this.§_-3z§;
         }
      }

      public function §_-6E§() : void
      {
         if(this.parent)
         {
            this.removeEventListener(Event.ENTER_FRAME,this.§_-5G§);
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
