---
title: Buddhist Sun App
date: 2025-11-25
categories:
  - software
  - interesting-things
tags:
  - app
  - buddhist
  - buddhist-sun
  - solar-noon
  - sun
  - zenith
  - software
authors:
  - bksubhuti
featured_image: /images/buddhist_sun_logo4.webp
---
{{< resizeimg src="/images/buddhist_sun_logo4.webp" width="150" alt="Buddhist Sun App" >}}

<div class="app-notice-card" style="margin: 2rem 0; padding: 1.4rem 1.7rem; background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%); border: 1.5px solid #22c55e; border-left: 6px solid #16a34a; border-radius: 14px; box-shadow: 0 4px 18px rgba(22, 163, 74, 0.12); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
  <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 8px; margin-bottom: 0.65rem;">
    <div style="display: flex; align-items: center; gap: 10px;">
      <span style="font-size: 1.6rem; line-height: 1;">✅</span>
      <span style="font-size: 1.28rem; font-weight: 700; color: #14532d; letter-spacing: -0.01em;">Android Only: App Fixed & Ready for Update</span>
    </div>
    <span style="display: inline-block; background: rgba(22, 163, 74, 0.16); color: #15803d; font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; padding: 4px 10px; border-radius: 9999px; border: 1px solid rgba(22, 163, 74, 0.35);">
      Android Only
    </span>
  </div>
  <p style="margin: 0; font-size: 1.15rem; line-height: 1.65; color: #14532d;">
    <strong>The Buddhist Sun app is now fixed and ready for update on Android!</strong> Please update or install the latest version via Google Play below.
  </p>
  <div style="margin-top: 0.75rem; padding-top: 0.65rem; border-top: 1px solid rgba(22, 163, 74, 0.25); font-size: 0.92rem; color: #166534;">
    <em>Note: This update applies to <strong>Android devices only</strong>. The iOS version was unaffected and continues to run normally.</em>
  </div>
</div>

{{< download-badges 
     android_id="com.bksubhuti.buddhistsun" 
     ios_url="https://apps.apple.com/us/app/buddhist-sun/id1585091207" 
>}}

Update November 25, 2025 with video and summary. First published September 2021.

## Summary:
This is an announcement of the iOS and Android Buddhist Sun App, created to help monastics and lay yogis know the correct times according to GPS position and day of the year.  
The app includes the following features:

- Solar Noon  
- Dawn times  
- Uposatha Days  
- Moons  
- GPS map  
- Countdown Timer  
- Notifications for upcoming Uposatha Days  

Recently, I made this mobile app to help me know when Solar Noon is approaching or has passed.

## Why Is the Sun Important for Bhikkhus?

## Why Is the Sun Important for 8 & 10 Precepts?

If you are a monk, nun, or practicing yogi who has vowed not to eat after Noon, this app will benefit you. The real Solar Noon is not 12:00 pm according to Buddhist rules, because there were no clocks in the Buddha’s time. Instead, the Sun’s position was used to determine when one should stop eating.

In addition to the Noon time, knowing the Dawn time is important because this marks when eating may begin. If one eats before Dawn, one is technically eating during “night” according to Vinaya interpretation.

This app calculates Dawn times based on several methods you can select. It also calculates Solar Noon and includes a speech countdown timer. GPS is used to calculate both Solar Noon and Dawn times with geographic accuracy. Myanmar, Sinhala, and Chinese languages are supported. Although it was created for monks, anyone following the 8 precepts will find it useful.

The default safety buffer is set to one minute, which can be increased or disabled. The astronomical algorithms are based on calculations by [Jean Meeus](https://en.wikipedia.org/wiki/Jean_Meeus) and are accurate to within one minute in normal geographical locations.

{{< youtube wCT1tiHJn0s >}}

## About:

Buddhist Sun is a small app created for Buddhist monks and nuns to display Solar Noon according to monastic needs. Because I usually eat with my hands, I needed a “hands-free” way to know when Noon is approaching. The countdown timer with voice notifications helps me know the remaining time while eating. I enjoy using this app, and I hope you do as well.

**Why is this important?**  
Those who follow Buddhist monastic rules are not allowed to eat after Noon. The rule is based on the Sun’s zenith position, not a mechanical clock. Since clocks did not exist in the Buddha’s time, the shadow was used to determine the correct moment. Others who follow the 8 or 10 precepts may also find this app helpful.

I recommend TimeandDate.com to verify the app’s accuracy. This app is meant for “present-moment” location use.

## Help:

**Calculations:**  
The calculations are based on *Astronomical Algorithms* by Jean Meeus. Sunrise and sunset results are theoretically accurate within one minute for locations between ±72° latitude. Please consider stopping well before the stated time.

**NOON:**  
The Noon screen displays Solar Noon for the current day as determined by GPS or selected City. All times include your chosen safety buffer.

**DAWN:**  
The Dawn screen displays your selected Dawn formula and related solar calculations. All times include your chosen safety buffer.  
- Pa-Auk = (Sunrise – 40 minutes)  
- Na-Uyana = (Sunrise – 30 minutes)

**GPS:**  
GPS will automatically set the city if the Internet is on and the checkbox is enabled. It is recommended to use GPS for your location because Solar Noon is most accurate this way. This was not tested with Daylight Savings Time regions.

**Settings Page:**

**Offset:**  
This is automatically set when using GPS. If you use the City Search in settings, you must select the correct offset (GMT ± your local time).

**Safety:**  
This subtracts minutes from Noon to make it earlier, and adds minutes to Dawnrise to make it later. The formula is accurate within one minute, so the default safety is 1 minute.

**Dawn:**  
Choose your preferred Dawnrise formula. Na-Uyana uses Sunrise – 30 minutes. Pa-Auk uses Sunrise – 40 minutes. Safety will add X minutes to this time.

**Timer:**  
The Timer screen allows hands-free audio notifications. “Speech” means Text-to-Speech. Volume is controlled by the slider.  
Under normal conditions, speech notifications only work while the screen is on. To fix this, use the “Screen Always On” switch, or enable “TTS with screen off.” This allows background operation while the screen is off and prevents the device from sleeping.  
Please test the background feature before relying on it. Some phones do not allow it. We are not responsible for anything.

When you close the application, it stops the background task. You will know the app is running in the background when the sun icon appears in your phone’s notification bar. If Buddhist Sun is not in background mode, you will not see a sun icon.  
This background feature is not available for iOS users.

Speech announcements occur at the following minute intervals:  
50, 40, 30, 20, 15, 10, 8, 6, 5, 4, 3, 2, 1, 0

**Privacy:**  
The full privacy statement is here:  
[https://americanmonk.org/privacy-policy-for-buddhist-sun-app/](https://americanmonk.org/privacy-policy-for-buddhist-sun-app/)  
We do not collect any information.

---

May this help you reach Nibbāna quickly and safely!
