export default class Utils {
    static setTimezone = () => {
        document.cookie = `browser_timezone=${Intl.DateTimeFormat().resolvedOptions().timeZone}`
    }
}