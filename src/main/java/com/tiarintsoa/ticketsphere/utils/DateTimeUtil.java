package com.tiarintsoa.ticketsphere.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeUtil {

    /**
     * Converts a LocalDateTime to a formatted string.
     *
     * @param dateTime the LocalDateTime to format
     * @param pattern  the pattern to use for formatting
     * @return the formatted date-time string
     */
    public static String format(LocalDateTime dateTime, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return dateTime.format(formatter);
    }

    /**
     * Converts a LocalDateTime to a formatted string.
     *
     * @param dateTime the LocalDateTime to format
     * @return the formatted date-time string
     */
    public static String format(LocalDateTime dateTime) {
        return format(dateTime, "yyyy-MM-dd HH:mm:ss");
    }
}