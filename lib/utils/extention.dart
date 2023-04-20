extension TimeToString on int {
  String timeToString() {
    if (this / 10 >= 1) {
      return "$this:00";
    }else {
      return "0$this:00";
    }
  }
}

extension RecipeTimeToString on int {
  String timeToStringRecipe() {
    var hours = (this/60).truncate();
    var string = "";
    var minutes = this -(hours*60);
    var timeToHour = this / 60;
    if(timeToHour>=1) {
      if (hours <= 4 && hours > 2) {
        string += "$hours часа";
      } else {
        if (hours > 2) {
          string += "$hours часов";
        } else {
          string += "$hours час";
        }
      }
    }
    if(timeToHour>1) {
      if (minutes != 0) {
        if (minutes != 1 || minutes >= 4) {
          string += " $minutes минут";
        } else {
          string += " $minutes минуты";
        }
      }
    }else {
      if (minutes != 0) {
        if (minutes == 1) {
          string += " $minutes минута";
        } else {
          if (minutes > 1 && minutes <= 4) {
            string += " $minutes минуты";
          }
          else {
            string += " $minutes минут";
          }
        }
      }
    }
    return string;
  }
}