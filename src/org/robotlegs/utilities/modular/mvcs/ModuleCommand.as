/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular.mvcs
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleCommandMap;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ModuleCommand extends Command
	{
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
		
		[Inject]
		public var moduleCommandMap:IModuleCommandMap;
	
	}
}