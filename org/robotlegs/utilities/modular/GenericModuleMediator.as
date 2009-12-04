/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

/* DO NOT EXTEND THIS CLASS!  It's just a template, and can be used for demos but your actual ModuleMediator should
be based on this class but extend Mediator as this one does. */

package org.robotlegs.utilities.modular
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.mvcs.Mediator;
	
	public class GenericModuleMediator extends Mediator
	{
		[Inject]
		public var view:GenericModule;
		
		[Inject]
		public var moduleDispatcher:ModuleEventDispatcher;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
			eventMap.mapListener(moduleDispatcher, "SomeModuleEvent", onSomeModuleEvent );
		}
		
		protected function onViewClick(e:MouseEvent):void
		{
			moduleDispatcher.dispatchEvent(new Event("SomeModuleEvent"));
		}
		
		protected function onSomeModuleEvent(e:Event):void
		{
			view.alpha *= 0.8;
			(view.alpha > 0.1) || (view.alpha = 0.9);
		}
	
	}
}