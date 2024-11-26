CapsLockTimer := 0  ;
CapsLockThreshold := 1 ; 

CapsLock::
    KeyWait, CapsLock, T%CapsLockThreshold% ;
    if (ErrorLevel) ; 
    {
        SetCapsLockState % !GetKeyState("CapsLock", "T") ;
    }
    else ;
    {
        Send ^{Space} ;
    }
    return
