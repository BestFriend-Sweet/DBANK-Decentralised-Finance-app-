import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 100;

  let id: Nat = 751247121296354545731;
  // id := 89416565465464;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print("Hello");
  // Debug.print(Natdebug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };
  // topup();

  // Allow users to withdraw an amount from the current Value
  public func withdrawal(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount; // Decrease the current Value by the amount
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero. (Negative balance!!!)");
    };
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * ((1+0.01) ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};