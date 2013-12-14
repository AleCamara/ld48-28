package ld28.utils 
{
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public function Assert(condition:Boolean, errorMessage:String = "Assertion failed!"):void 
	{
		if (!condition)
		{
			throw new Error(errorMessage);
		}
	}

}