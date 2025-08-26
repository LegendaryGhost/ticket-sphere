package com.tiarintsoa.ticketsphere.utils;

import java.time.LocalDate;
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
    public static String humanFormat(LocalDateTime dateTime, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return dateTime.format(formatter);
    }

    /**
     * Converts a LocalDateTime to a human-readable formatted string.
     *
     * @param dateTime the LocalDateTime to format
     * @return the formatted date-time string
     */
    public static String humanFormat(LocalDateTime dateTime) {
        return humanFormat(dateTime, "yyyy-MM-dd HH:mm:ss");
    }

    public static String humanFormat(LocalDate date, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return date.format(formatter);
    }

    public static String humanFormat(LocalDate date) {
        return humanFormat(date, "yyyy-MM-dd");
    }

    public static String htmlFormat(LocalDateTime dateTime) {
        return dateTime == null ? "" : dateTime.format(DateTimeFormatter.ISO_DATE_TIME);
    }
}