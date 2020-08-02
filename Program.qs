namespace Quantum.Quantum_Password_generator
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    @EntryPoint()
    operation HelloQ () : Unit
    {
        mutable Binaries = new Result[0];
        mutable Number = 0.0;
        mutable index = 0.0;
        mutable IntIndex = 0;
    
        repeat
        {
            using(qubit = Qubit())
            {
                H(qubit);
                set Binaries += [M(qubit)];
			}
    
            if (Binaries[IntIndex] == One)
            {
                set Number = Number + 2.0 ^ index;
			}

            set index = index + 1.0;
            set IntIndex = IntIndex + 1;
		}
        until (index > 63.0);

        set Number = Number / 2.0 ^ 64.0;

        Message($"Number generated: {Number}");
    }
}
