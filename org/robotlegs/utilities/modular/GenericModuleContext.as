/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

/* Unless you're just doing a quick demo this class should always be extended */

package org.robotlegs.utilities.modular
{
	import org.robotlegs.utilities.modular.ModuleCommandMap;
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.GenericModule;
	import org.robotlegs.mvcs.Context;
	
	public class GenericModuleContext extends Context
	{   
		// this var is only a helper to make the diagnosis of errors related to startup() running before setModuleDispatcher more obvious.
		protected var _isModuleDispatcherSet:Boolean = false;
		
		public function GenericModuleContext(contextView:GenericModule = null):void
		{   
			// the module startup can't be run until setModuleDispatcher has happened.
			// I've put in a boolean to capture this to make diagnostics easier as it's a gotcha.
			
			super(contextView, false)
		}
		
		override public function startup():void
		{	
			// this has no purpose other than to make it obvious what you've done wrong...
			
			if(!_isModuleDispatcherSet){
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
			}
			
			mediatorMap.mapView(GenericModule, GenericModuleMediator);
			super.startup();
		}
		
		public function setModuleDispatcher(dispatcher:ModuleEventDispatcher):void
		{
			injector.mapValue(ModuleEventDispatcher, dispatcher);
			injector.mapValue(ModuleCommandMap, new ModuleCommandMap(dispatcher, injector, reflector));
		
		    _isModuleDispatcherSet = true;
		
		}
	
	}
}