/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.utilities.modular.mvcs
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ModuleMediator extends Mediator
	{
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
	   		
		[Inject]
		public var moduleCommandMap:IModuleCommandMap;
	                                                                   
	
		// Helper functions for passing events between / around modules
		protected function redispatchToModules(e:Event):void{
			moduleDispatcher.dispatchEvent(e);
		}
	
		protected function redispatchInternally(e:Event):void{
			// you could equally use the dispatch(e) helper, but sometimes longhand offers clarity
			eventDispatcher.dispatchEvent(e);
		}   
	
	}
	
}