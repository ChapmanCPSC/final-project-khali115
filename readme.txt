References:
http://stackoverflow.com/questions/35215694/format-timer-label-to-hoursminutesseconds-in-swift

http://stackoverflow.com/questions/29243564/change-uipicker-color-swift

https://www.youtube.com/watch?v=QozQ3RYlBSA&index=21&list=PL3MWPU0RhJzHSHn1P1zZ0p1dcUKsppiya

https://www.youtube.com/watch?v=O68O7yUK_9c

The intervals for workTime and activityTime can be changed from the SettingsValues.swift file. For right now both default times are set to 10 seconds. Going to the settings page and adjusting the intervals will change these values. I would recommend not selecting anything from the settings page to use the short default values. Or the interval values can be changed from the SettingsViewController.swift file in selectActivityInterval action and pickerView didSelectRow function.