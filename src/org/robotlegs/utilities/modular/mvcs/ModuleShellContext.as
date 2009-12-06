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
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.core.IModuleCommandMap;
	import org.robotlegs.utilities.modular.core.IModuleContextView;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ModuleShellContext extends Context
	{
		public function ModuleShellContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			injector.mapSingletonOf(IModuleEventDispatcher, ModuleEventDispatcher);
			injector.mapSingletonOf(IModuleCommandMap, ModuleCommandMap);
			viewMap.mapType(IModuleContextView);
			super.startup();
		}
	
	}
}