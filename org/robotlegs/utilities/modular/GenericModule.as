/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */ 

/* RECOMMENDED USAGE: Swf modules should extend this class

	They will have a reference to the GenericModuleContext - through context.
	If you require a more specific reference to the context in your Module then do:
	
	private var specialContext:SpecialContext; 
*/


package org.robotlegs.utilities.modular
{
	
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.IModuleContextView;
	import org.robotlegs.utilities.modular.GenericModuleContext;
	import flash.display.MovieClip;
	
	public class GenericModule extends MovieClip implements IModuleContextView
	{
		
		protected var context:GenericModuleContext;
		
		public function GenericModule():void
		{
			// in your extending class do:
			// context = new SpecialContext(this);
			// or - if you need to know the specific class of the context
			// specialContext = new SpecialContext(this);
			// context = specialContext;
		}
		
		
		public function setModuleDispatcher(dispatcher:ModuleEventDispatcher):void
		{
			context.setModuleDispatcher(dispatcher);
		}
		
		// simply exposes the startup function of the context
		// don't forget to call setModuleDispatcher before startup... 
		public function startup():void{
			context.startup();
		}
	
	}
}