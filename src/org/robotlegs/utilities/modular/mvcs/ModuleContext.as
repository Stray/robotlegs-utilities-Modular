/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular.mvcs
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.base.ModuleCommandMap;
	import org.robotlegs.utilities.modular.core.IModuleCommandMap;
	import org.robotlegs.utilities.modular.core.IModuleContext;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ModuleContext extends Context implements IModuleContext
	{
		protected var _isModuleDispatcherSet:Boolean;
		
		public function ModuleContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			if (!_isModuleDispatcherSet)
			{
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
				trace("Make sure that you have a shell context, and that IModuleContextView has been set up for injection via a viewMap");
			}
			super.startup();
		}
		
		public function setModuleDispatcher(dispatcher:IModuleEventDispatcher):void
		{
			injector.mapValue(IModuleEventDispatcher, dispatcher);
			injector.mapSingletonOf(IModuleCommandMap, ModuleCommandMap);
			_isModuleDispatcherSet = true;
		}
	}
}