/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ModuleEventDispatcher extends EventDispatcher
	{
		public function ModuleEventDispatcher(target:IEventDispatcher = null)
		{
			super(target);
		}
	}
}