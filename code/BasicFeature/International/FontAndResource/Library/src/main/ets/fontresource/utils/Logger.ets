/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Import hilog from the Performance Analysis Kit so this class can emit system logs.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the context type so the file logger can resolve the sandbox directory.
import { common } from '@kit.AbilityKit';
// Import the file I/O module (aliased as fs) so log lines can be persisted to a file.
import { fileIo as fs } from '@kit.CoreFileKit';

// The hilog domain that groups every log line emitted by this library.
const DOMAIN: number = 0xFF00;
// The hilog tag prefix that identifies log lines coming from this sample project.
const PREFIX: string = '[Sample_FontAndResource]';
// The hilog format string that prints the composed message as a public (non-redacted) string.
const FORMAT: string = '%{public}s';
// The fallback tag used when a caller logs without providing a module tag.
const DEFAULT_TAG: string = 'App';
// The sandbox sub-directory (relative to filesDir) where log files are stored.
const LOG_DIR_NAME: string = '/logs';
// The file name prefix for daily log files, followed by the date and the extension.
const LOG_FILE_PREFIX: string = 'app-';
// The file name extension for daily log files.
const LOG_FILE_EXT: string = '.log';
// The maximum length of a single log line that is appended to the file.
const MAX_FILE_LINE_LENGTH: number = 1024;

// Log level constants expressed as plain numbers so callers can compare and filter cheaply.
export class LogLevel {
  // Verbose development-only detail, the most granular level.
  static readonly DEBUG: number = 0;
  // Normal informational messages that record the happy-path flow.
  static readonly INFO: number = 1;
  // Warning messages that indicate something suspicious but recoverable.
  static readonly WARN: number = 2;
  // Error messages that indicate a failed operation.
  static readonly ERROR: number = 3;
  // Fatal messages that indicate the application cannot continue normally.
  static readonly FATAL: number = 4;
  // The count of levels, useful for building arrays indexed by level.
  static readonly COUNT: number = 5;
}

// A unified logging facade on top of hilog with five levels, module tags and optional file output.
export class Logger {
  // The absolute sandbox directory that receives daily log files; empty until init() runs.
  private static logDir: string = '';
  // Whether file logging is enabled; false by default so hilog remains the only channel.
  private static fileLogEnabled: boolean = false;
  // The minimum level a message must have to be emitted; messages below it are dropped.
  private static minLevel: number = LogLevel.DEBUG;

  // Initializes the logger with a context so file logging knows where to write.
  static init(context: common.Context, enableFileLog: boolean): void {
    // Compose the absolute log directory from the application files directory.
    Logger.logDir = context.filesDir + LOG_DIR_NAME;
    // Store the caller's choice for whether lines are mirrored into a file.
    Logger.fileLogEnabled = enableFileLog;
    // Announce the initialization through hilog so it is visible immediately.
    hilog.info(DOMAIN, PREFIX, FORMAT, `[${DEFAULT_TAG}] Logger initialized, fileLog=${enableFileLog}`);
  }

  // Turns file logging on or off at runtime without changing the log directory.
  static setFileLogEnabled(enabled: boolean): void {
    // Persist the new switch value into the static field.
    Logger.fileLogEnabled = enabled;
  }

  // Sets the minimum level that a message must reach before it is emitted.
  static setMinLevel(level: number): void {
    // Store the new threshold into the static field.
    Logger.minLevel = level;
  }

  // Logs a debug-level line with an explicit module tag.
  static debug(tag: string, message: string): void;
  // Logs a debug-level line with the default tag, kept for backward compatibility.
  static debug(message: string): void;
  // The single implementation behind both debug overloads.
  static debug(tagOrMessage: string, message?: string): void {
    // Dispatch to the shared writer with the debug level.
    Logger.write(LogLevel.DEBUG, tagOrMessage, message);
  }

  // Logs an info-level line with an explicit module tag.
  static info(tag: string, message: string): void;
  // Logs an info-level line with the default tag, kept for backward compatibility.
  static info(message: string): void;
  // The single implementation behind both info overloads.
  static info(tagOrMessage: string, message?: string): void {
    // Dispatch to the shared writer with the info level.
    Logger.write(LogLevel.INFO, tagOrMessage, message);
  }

  // Logs a warn-level line with an explicit module tag.
  static warn(tag: string, message: string): void;
  // Logs a warn-level line with the default tag, kept for backward compatibility.
  static warn(message: string): void;
  // The single implementation behind both warn overloads.
  static warn(tagOrMessage: string, message?: string): void {
    // Dispatch to the shared writer with the warn level.
    Logger.write(LogLevel.WARN, tagOrMessage, message);
  }

  // Logs an error-level line with an explicit module tag.
  static error(tag: string, message: string): void;
  // Logs an error-level line with the default tag, kept for backward compatibility.
  static error(message: string): void;
  // The single implementation behind both error overloads.
  static error(tagOrMessage: string, message?: string): void {
    // Dispatch to the shared writer with the error level.
    Logger.write(LogLevel.ERROR, tagOrMessage, message);
  }

  // Logs a fatal-level line with an explicit module tag.
  static fatal(tag: string, message: string): void;
  // Logs a fatal-level line with the default tag, kept for backward compatibility.
  static fatal(message: string): void;
  // The single implementation behind both fatal overloads.
  static fatal(tagOrMessage: string, message?: string): void {
    // Dispatch to the shared writer with the fatal level.
    Logger.write(LogLevel.FATAL, tagOrMessage, message);
  }

  // Converts a numeric level into its uppercase display name.
  static levelName(level: number): string {
    // Select the name that matches the numeric level.
    if (level === LogLevel.DEBUG) {
      // Return the name for the debug level.
      return 'DEBUG';
    }
    // Handle the info level.
    if (level === LogLevel.INFO) {
      // Return the name for the info level.
      return 'INFO';
    }
    // Handle the warn level.
    if (level === LogLevel.WARN) {
      // Return the name for the warn level.
      return 'WARN';
    }
    // Handle the error level.
    if (level === LogLevel.ERROR) {
      // Return the name for the error level.
      return 'ERROR';
    }
    // Everything else is treated as the fatal level.
    // Return the name for the fatal level.
    return 'FATAL';
  }

  // The shared writer that filters, formats, and forwards one log line to hilog and the file.
  private static write(level: number, tagOrMessage: string, message?: string): void {
    // Resolve the effective tag: the first argument is the tag when a second message exists.
    const tag: string = message === undefined ? DEFAULT_TAG : tagOrMessage;
    // Resolve the effective message: the first argument is the message when no second exists.
    const text: string = message === undefined ? tagOrMessage : message;
    // Drop the line early when its level is below the configured minimum threshold.
    if (level < Logger.minLevel) {
      // Stop here so quiet levels stay silent when a higher threshold is set.
      return;
    }
    // Compose the final line in the "[Tag] message" shape shared by both channels.
    const line: string = '[' + tag + '] ' + text;
    // Forward the line to the matching hilog level function.
    Logger.emit(level, line);
    // Mirror the line into the daily log file when file logging is switched on.
    Logger.appendToFile(level, line);
  }

  // Picks the matching hilog severity function and prints the composed line.
  private static emit(level: number, line: string): void {
    // Route debug lines to hilog.debug.
    if (level === LogLevel.DEBUG) {
      // Print through the debug severity so it appears only when debug logging is on.
      hilog.debug(DOMAIN, PREFIX, FORMAT, line);
      // Stop the routing here.
      return;
    }
    // Route info lines to hilog.info.
    if (level === LogLevel.INFO) {
      // Print through the info severity.
      hilog.info(DOMAIN, PREFIX, FORMAT, line);
      // Stop the routing here.
      return;
    }
    // Route warn lines to hilog.warn.
    if (level === LogLevel.WARN) {
      // Print through the warn severity.
      hilog.warn(DOMAIN, PREFIX, FORMAT, line);
      // Stop the routing here.
      return;
    }
    // Route error lines to hilog.error.
    if (level === LogLevel.ERROR) {
      // Print through the error severity.
      hilog.error(DOMAIN, PREFIX, FORMAT, line);
      // Stop the routing here.
      return;
    }
    // Everything remaining is fatal.
    // Route fatal lines to hilog.error because hilog has no dedicated fatal severity.
    hilog.error(DOMAIN, PREFIX, FORMAT, line);
  }

  // Builds the full text of one file line, including the level name and a timestamp.
  private static fileLine(level: number, line: string): string {
    // Read the current wall clock to timestamp the line.
    const now: Date = new Date();
    // Compose the HH:mm:ss portion of the timestamp with zero padding.
    const time: string = Logger.pad(now.getHours()) + ':' + Logger.pad(now.getMinutes()) + ':' +
      Logger.pad(now.getSeconds());
    // Prepend the level name and timestamp to the caller line.
    return time + ' ' + Logger.levelName(level) + ' ' + line;
  }

  // Builds today's log file name in the "app-YYYY-MM-DD.log" shape.
  private static todayFileName(): string {
    // Read the current date once so all fields come from the same instant.
    const now: Date = new Date();
    // Compose the zero-padded four digit year.
    const year: string = now.getFullYear().toString();
    // Compose the zero-padded two digit month (Date months are zero based).
    const month: string = Logger.pad(now.getMonth() + 1);
    // Compose the zero-padded two digit day of month.
    const day: string = Logger.pad(now.getDate());
    // Concatenate prefix, date parts and extension into the final name.
    return LOG_FILE_PREFIX + year + '-' + month + '-' + day + LOG_FILE_EXT;
  }

  // Appends one levelled line to today's log file, creating the directory when needed.
  private static appendToFile(level: number, line: string): void {
    // Skip file output entirely when logging has never been initialized with a directory.
    if (!Logger.fileLogEnabled || Logger.logDir === '') {
      // Stop here so the hilog channel stays the only active one.
      return;
    }
    try {
      // Create the log directory recursively the first time a line is written.
      if (!fs.accessSync(Logger.logDir)) {
        // Create every missing path segment of the log directory.
        fs.mkdirSync(Logger.logDir, true);
      }
      // Resolve the full path of today's log file.
      const filePath: string = Logger.logDir + '/' + Logger.todayFileName();
      // Open (or create) the file in append mode and keep the handle local.
      const file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.APPEND);
      try {
        // Trim overly long lines so one bad message cannot bloat the file; shorter lines stay intact.
        const text: string = Logger.fileLine(level, line).substring(0, MAX_FILE_LINE_LENGTH);
        // Write the composed line followed by a newline separator.
        fs.writeSync(file.fd, text + '\n');
      } finally {
        // Always close the handle so descriptors do not leak on repeated logging.
        fs.closeSync(file);
      }
    } catch (error) {
      // Swallow file failures: logging must never crash the caller.
      // Print the failure reason through hilog so it is at least observable.
      hilog.warn(DOMAIN, PREFIX, FORMAT, '[Logger] Failed to append log to file');
    }
  }

  // Converts a single-digit number into a two-character zero-padded string.
  private static pad(value: number): string {
    // Prefix small values with one leading zero.
    return value < 10 ? '0' + value.toString() : value.toString();
  }
}
