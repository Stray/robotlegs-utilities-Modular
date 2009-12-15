s/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular.mvcs
{
	import flash.display.Sprite;
	
	import org.robotlegs.utilities.modular.core.IModuleContextView;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ModuleContextView extends Sprite implements IModuleContextView
	{
		protected var context:ModuleContext;
		
		public function ModuleContextView()
		{
		}
		
		public function setModuleDispatcher(dispatcher:IModuleEventDispatcher):void
		{
			context.setModuleDispatcher(dispatcher);
		}
	}
}