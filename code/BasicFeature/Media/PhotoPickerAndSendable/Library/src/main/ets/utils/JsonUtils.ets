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

// Indentation unit used by the pretty printer.
const INDENT_UNIT: string = '  ';
// Marker used when stringify cannot serialize the value.
const TEXT_UNSERIALIZABLE: string = '[unserializable]';
// Marker used when the text cannot be parsed.
const TEXT_INVALID_JSON: string = '[invalid json]';
// Opening character of an object or of an array.
const OPEN_OBJECT: string = '{';
// Closing character of an object.
const CLOSE_OBJECT: string = '}';
// Opening character of an array.
const OPEN_ARRAY: string = '[';
// Closing character of an array.
const CLOSE_ARRAY: string = ']';
// Character that starts and ends a json string.
const QUOTE: string = '"';
// Character that separates a key from its value.
const COLON: string = ':';
// Character that separates two entries of a container.
const COMMA: string = ',';
// Characters that do not affect the json structure.
const INSIGNIFICANT: string = ' \t\n\r';

/**
 * Json helpers used by the logging and trace call sites.
 * The parser only validates and re-indents, it never builds typed objects,
 * so no cast is needed anywhere in this module.
 */
export class JsonUtils {
  /**
   * Converts a value into json text without throwing.
   * Arrays of strings and plain texts are supported on purpose:
   * a typed serialization needs a class with a toJSON implementation.
   * @param value Value to serialize, undefined and null are accepted.
   * @returns Json text, or a placeholder when the value cannot be serialized.
   */
  static stringifySafe(value: string[] | string | undefined | null): string {
    // Missing values are rendered as the json null literal.
    if (value === undefined || value === null) {
      return 'null';
    }
    // Plain text is quoted through the platform serializer.
    if (typeof value === 'string') {
      return JsonUtils.quote(value);
    }
    // Arrays are serialized entry by entry.
    return JsonUtils.stringifyArray(value);
  }

  /**
   * Serializes a string list into a json array.
   * @param items Texts to serialize.
   * @returns Json array text.
   */
  private static stringifyArray(items: string[]): string {
    // Collect the serialized entries in a temporary buffer.
    const buffer: string[] = [];
    // Walk the list with an index based loop.
    for (let index: number = 0; index < items.length; index++) {
      // Read the current entry through an intermediate variable.
      const item: string = items[index];
      // Holes are rendered as the json null literal.
      if (item === undefined || item === null) {
        buffer.push('null');
        continue;
      }
      // Quote the entry so the result stays valid json.
      buffer.push(JsonUtils.quote(item));
    }
    // Wrap the entries with the array brackets.
    return OPEN_ARRAY + buffer.join(COMMA) + CLOSE_ARRAY;
  }

  /**
   * Quotes a text as a json string.
   * @param text Text to quote.
   * @returns Quoted and escaped text.
   */
  private static quote(text: string): string {
    // Delegate the escaping to the platform serializer, a plain string always succeeds.
    const quoted: string | undefined = JSON.stringify(text);
    // Fall back to a manual quoting when the platform refuses the value.
    if (quoted === undefined) {
      return QUOTE + TEXT_UNSERIALIZABLE + QUOTE;
    }
    // Hand the platform result back.
    return quoted;
  }

  /**
   * Checks whether the text is syntactically valid json.
   * @param text Text to validate, undefined and null are accepted.
   * @returns True when the platform parser accepts the text.
   */
  static isValidJson(text: string | undefined | null): boolean {
    // Missing or blank text is not json.
    if (text === undefined || text === null || JsonUtils.trimInsignificant(text).length === 0) {
      return false;
    }
    // The platform parser is the authoritative check.
    try {
      // The result is discarded on purpose, only the failure matters here.
      JSON.parse(text);
      // Reaching this line means the text is valid.
      return true;
    } catch (error) {
      // Any parser error means the text is not valid json.
      return false;
    }
  }

  /**
   * Re-indents a json text with two spaces per level.
   * @param text Text to format, undefined and null are accepted.
   * @param indent Current indentation, used by the recursion.
   * @returns Indented json text, or a placeholder when the text is not valid json.
   */
  static prettyPrint(text: string | undefined | null, indent?: string): string {
    // Resolve the current indentation level.
    const level: string = indent !== undefined && indent !== null ? indent : '';
    // Missing text cannot be formatted.
    if (text === undefined || text === null) {
      return TEXT_INVALID_JSON;
    }
    // The text has to be valid json before it can be re-indented.
    if (!JsonUtils.isValidJson(text)) {
      return TEXT_INVALID_JSON;
    }
    // Re-indent the significant part of the text.
    return JsonUtils.formatValue(JsonUtils.trimInsignificant(text), level);
  }

  /**
   * Re-indents one json value.
   * @param text Significant json text without leading or trailing blanks.
   * @param level Current indentation.
   * @returns Indented json text.
   */
  private static formatValue(text: string, level: string): string {
    // An object is re-indented entry by entry.
    if (JsonUtils.isObject(text)) {
      return JsonUtils.formatObject(text, level);
    }
    // An array is re-indented entry by entry as well.
    if (text.charAt(0) === OPEN_ARRAY) {
      return JsonUtils.formatArray(text, level);
    }
    // Scalars keep their original text.
    return text;
  }

  /**
   * Re-indents a json object.
   * @param text Significant object text including both braces.
   * @param level Current indentation.
   * @returns Indented object text.
   */
  private static formatObject(text: string, level: string): string {
    // Split the body of the object into its entries.
    const entries: string[] = JsonUtils.splitTopLevel(text.substring(1, text.length - 1));
    // An empty object stays on one line.
    if (entries.length === 0) {
      return OPEN_OBJECT + CLOSE_OBJECT;
    }
    // Build the inner indentation of the entries.
    const inner: string = level + INDENT_UNIT;
    // Collect the rendered entries in a temporary buffer.
    const buffer: string[] = [];
    // Render every entry on its own line.
    for (let index: number = 0; index < entries.length; index++) {
      // Re-indent the key and the value of the current entry.
      buffer.push(inner + JsonUtils.formatEntry(entries[index], inner));
    }
    // Join the entries and close the object on a new line.
    return OPEN_OBJECT + '\n' + buffer.join(COMMA + '\n') + '\n' + level + CLOSE_OBJECT;
  }

  /**
   * Re-indents one 'key: value' entry of a json object.
   * @param entry Significant entry text.
   * @param level Current indentation of the entry.
   * @returns Indented entry text.
   */
  private static formatEntry(entry: string, level: string): string {
    // Locate the separator between the key and the value.
    const separator: number = JsonUtils.indexOfTopLevel(entry, COLON);
    // Without a separator the entry is returned unchanged.
    if (separator < 0) {
      return entry;
    }
    // Keep the key text untouched.
    const key: string = JsonUtils.trimInsignificant(entry.substring(0, separator));
    // Re-indent the value of the entry.
    const value: string = JsonUtils.formatValue(JsonUtils.trimInsignificant(entry.substring(separator + 1)), level);
    // Join key and value with the standard separator pair.
    return key + COLON + ' ' + value;
  }

  /**
   * Re-indents a json array.
   * @param text Significant array text including both brackets.
   * @param level Current indentation.
   * @returns Indented array text.
   */
  private static formatArray(text: string, level: string): string {
    // Split the body of the array into its entries.
    const entries: string[] = JsonUtils.splitTopLevel(text.substring(1, text.length - 1));
    // An empty array stays on one line.
    if (entries.length === 0) {
      return OPEN_ARRAY + CLOSE_ARRAY;
    }
    // Build the inner indentation of the entries.
    const inner: string = level + INDENT_UNIT;
    // Collect the rendered entries in a temporary buffer.
    const buffer: string[] = [];
    // Render every entry on its own line.
    for (let index: number = 0; index < entries.length; index++) {
      // Re-indent the current entry.
      buffer.push(inner + JsonUtils.formatValue(entries[index], inner));
    }
    // Join the entries and close the array on a new line.
    return OPEN_ARRAY + '\n' + buffer.join(COMMA + '\n') + '\n' + level + CLOSE_ARRAY;
  }

  /**
   * Removes every insignificant character from a json text.
   * Insignificant characters outside of strings are spaces, tabs and line breaks.
   * @param text Text to minify, undefined and null are accepted.
   * @returns Minified json text, or a placeholder when the text is not valid json.
   */
  static minify(text: string | undefined | null): string {
    // Missing text cannot be minified.
    if (text === undefined || text === null) {
      return TEXT_INVALID_JSON;
    }
    // The text has to be valid json before the blanks can be dropped.
    if (!JsonUtils.isValidJson(text)) {
      return TEXT_INVALID_JSON;
    }
    // Collect the significant characters in a temporary buffer.
    let buffer: string = '';
    // Track whether the cursor sits inside a string literal.
    let inString: boolean = false;
    // Track whether the previous character was an escape marker.
    let escaped: boolean = false;
    // Walk the text character by character.
    for (let index: number = 0; index < text.length; index++) {
      // Read the current character.
      const character: string = text.charAt(index);
      // An escaped character is copied without any interpretation.
      if (escaped) {
        buffer = buffer + character;
        escaped = false;
        continue;
      }
      // The escape marker always opens an escape sequence.
      if (character === '\\') {
        buffer = buffer + character;
        escaped = true;
        continue;
      }
      // A quote toggles the string state when it is not escaped.
      if (character === QUOTE) {
        inString = !inString;
        buffer = buffer + character;
        continue;
      }
      // Blanks outside of a string carry no meaning.
      if (!inString && INSIGNIFICANT.indexOf(character) >= 0) {
        continue;
      }
      // Every other character is significant.
      buffer = buffer + character;
    }
    // Hand the minified text back.
    return buffer;
  }

  /**
   * Removes the leading and trailing insignificant characters of a json text.
   * @param text Text to trim.
   * @returns Trimmed text.
   */
  private static trimInsignificant(text: string): string {
    // Locate the first significant character.
    let start: number = 0;
    // Advance while the current character is insignificant.
    while (start < text.length && INSIGNIFICANT.indexOf(text.charAt(start)) >= 0) {
      start = start + 1;
    }
    // Locate the last significant character.
    let end: number = text.length;
    // Retreat while the current character is insignificant.
    while (end > start && INSIGNIFICANT.indexOf(text.charAt(end - 1)) >= 0) {
      end = end - 1;
    }
    // Return the significant slice of the text.
    return text.substring(start, end);
  }

  /**
   * Checks whether the significant text is a json object.
   * @param text Significant json text.
   * @returns True when the text starts with an opening brace and ends with a closing brace.
   */
  private static isObject(text: string): boolean {
    // Both boundaries have to match the object syntax.
    return text.charAt(0) === OPEN_OBJECT && text.charAt(text.length - 1) === CLOSE_OBJECT;
  }

  /**
   * Splits the body of a container on the top level separators.
   * Separators inside strings and inside nested containers are ignored.
   * @param body Text between the two container delimiters.
   * @returns List of significant entry texts, an empty list for an empty container.
   */
  private static splitTopLevel(body: string): string[] {
    // Collect the entries in a temporary buffer.
    const entries: string[] = [];
    // Remember where the current entry starts.
    let start: number = 0;
    // Track the nesting depth of objects and arrays.
    let depth: number = 0;
    // Track whether the cursor sits inside a string literal.
    let inString: boolean = false;
    // Track whether the previous character was an escape marker.
    let escaped: boolean = false;
    // Walk the body character by character.
    for (let index: number = 0; index < body.length; index++) {
      // Read the current character.
      const character: string = body.charAt(index);
      // An escaped character never changes the state.
      if (escaped) {
        escaped = false;
        continue;
      }
      // The escape marker opens an escape sequence.
      if (character === '\\') {
        escaped = true;
        continue;
      }
      // Strings hide every structural character.
      if (character === QUOTE) {
        inString = !inString;
        continue;
      }
      // Structural characters inside a string are plain text.
      if (inString) {
        continue;
      }
      // An opening delimiter deepens the nesting.
      if (character === OPEN_OBJECT || character === OPEN_ARRAY) {
        depth = depth + 1;
        continue;
      }
      // A closing delimiter flattens the nesting.
      if (character === CLOSE_OBJECT || character === CLOSE_ARRAY) {
        depth = depth - 1;
        continue;
      }
      // Only a top level comma really separates two entries.
      if (character === COMMA && depth === 0) {
        JsonUtils.pushEntry(entries, body.substring(start, index));
        start = index + 1;
      }
    }
    // Copy the trailing entry as well.
    JsonUtils.pushEntry(entries, body.substring(start));
    // Hand the entries back.
    return entries;
  }

  /**
   * Adds an entry to the list unless it carries no significant character.
   * @param entries Target list.
   * @param candidate Entry text.
   */
  private static pushEntry(entries: string[], candidate: string): void {
    // Remove the insignificant characters around the entry.
    const trimmed: string = JsonUtils.trimInsignificant(candidate);
    // An empty entry appears in an empty body and is skipped.
    if (trimmed.length === 0) {
      return;
    }
    // Keep the significant entry.
    entries.push(trimmed);
  }

  /**
   * Finds the first top level occurrence of a character.
   * @param text Text to scan.
   * @param target Character to look for.
   * @returns Position of the character, minus one when it is absent.
   */
  private static indexOfTopLevel(text: string, target: string): number {
    // Track the nesting depth of objects and arrays.
    let depth: number = 0;
    // Track whether the cursor sits inside a string literal.
    let inString: boolean = false;
    // Track whether the previous character was an escape marker.
    let escaped: boolean = false;
    // Walk the text character by character.
    for (let index: number = 0; index < text.length; index++) {
      // Read the current character.
      const character: string = text.charAt(index);
      // An escaped character never changes the state.
      if (escaped) {
        escaped = false;
        continue;
      }
      // The escape marker opens an escape sequence.
      if (character === '\\') {
        escaped = true;
        continue;
      }
      // Strings hide every structural character.
      if (character === QUOTE) {
        inString = !inString;
        continue;
      }
      // Structural characters inside a string are plain text.
      if (inString) {
        continue;
      }
      // An opening delimiter deepens the nesting.
      if (character === OPEN_OBJECT || character === OPEN_ARRAY) {
        depth = depth + 1;
        continue;
      }
      // A closing delimiter flattens the nesting.
      if (character === CLOSE_OBJECT || character === CLOSE_ARRAY) {
        depth = depth - 1;
        continue;
      }
      // Only a top level match is reported.
      if (character === target && depth === 0) {
        return index;
      }
    }
    // The character is absent on the top level.
    return -1;
  }
}
