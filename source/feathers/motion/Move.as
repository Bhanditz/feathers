/*
Feathers
Copyright 2012-2017 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.motion
{
	import feathers.core.IFeathersControl;

	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.display.DisplayObject;

	/**
	 * Animates a component's <code>x</code> and <code>y</code> position. 
	 *
	 * @productversion Feathers 3.5.0
	 */
	public class Move
	{
		/**
		 * Creates an effect function for the target component that animates
		 * its x and y position when they are changed. Must be used with
		 * the <code>moveEffect</code> property.
		 * 
		 * @see feathers.core.FeathersControl#moveEffect
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createMoveEffect(duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IMoveEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.moveTo(target.x, target.y);
				return new TweenMoveEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its position from its current location to a new
		 * location.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createMoveToXYEffect(toX:Number, toY:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.moveTo(toX, toY);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its position from a specific location to its
		 * current location.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createMoveFromXYEffect(fromX:Number, fromY:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var oldX:Number = target.x;
				var oldY:Number = target.y;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).suspendEffects();
				}
				target.x = fromX;
				target.y = fromY;
				if(target is IFeathersControl)
				{
					IFeathersControl(target).resumeEffects();
				}
				var tween:Tween = new Tween(target, duration, ease);
				tween.moveTo(oldX, oldY);
				return new TweenEffectContext(tween);
			}
		}

		/**
		 * Creates an effect function for the target component that
		 * animates its position from its current location to a new
		 * location calculated by an offset.
		 *
		 * @productversion Feathers 3.5.0
		 */
		public static function createMoveByXYEffect(byX:Number, byY:Number, duration:Number = 0.5, ease:Object = Transitions.EASE_OUT):Function
		{
			return function(target:DisplayObject):IEffectContext
			{
				var tween:Tween = new Tween(target, duration, ease);
				tween.moveTo(target.x + byX, target.y + byY);
				return new TweenEffectContext(tween);
			}
		}
	}
}