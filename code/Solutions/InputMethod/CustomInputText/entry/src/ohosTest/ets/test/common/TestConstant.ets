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

/**
 * Shared constants for the CustomInputText ohosTest suites.
 *
 * Every literal here is copied from the application under test:
 * pages/Index.ets (ids and flag-driven labels), components/CustomInputText.ets
 * (editing constants) and utils/InputAttributeInit.ets (resource names). Tests
 * use these names instead of repeating raw literals so that a rename in the
 * application is caught by one constant only.
 */

export const BUNDLE_NAME: string = 'com.samples.customtextinput';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const TEST_MODULE: string = 'entry_test';
export const CASE_PREFIX: string = 'customInputText_';

export const TAG_INSERT: string = '[Sample_CustomInputText_Insert]';
export const TAG_DELETE_LEFT: string = '[Sample_CustomInputText_DeleteLeft]';
export const TAG_DELETE_RIGHT: string = '[Sample_CustomInputText_DeleteRight]';
export const TAG_MOVE_CURSOR: string = '[Sample_CustomInputText_MoveCursor]';
export const TAG_SELECT_MOVEMENT: string = '[Sample_CustomInputText_SelectMovement]';
export const TAG_SELECT_RANGE: string = '[Sample_CustomInputText_SelectRange]';
export const TAG_EXTEND_ACTION: string = '[Sample_CustomInputText_ExtendAction]';
export const TAG_CALCULATE_CURSOR: string = '[Sample_CustomInputText_CalculateCursor]';
export const TAG_CURSOR_GEOMETRY: string = '[Sample_CustomInputText_CursorGeometry]';
export const TAG_SESSION: string = '[Sample_CustomInputText_Session]';
export const TAG_PAGE: string = '[Sample_CustomInputText_Page]';
export const TAG_ATTRIBUTE: string = '[Sample_CustomInputText_Attribute]';
export const TAG_COMPOSITION: string = '[Sample_CustomInputText_Composition]';
export const TAG_UNICODE: string = '[Sample_CustomInputText_Unicode]';
export const TAG_MEASURE: string = '[Sample_CustomInputText_Measure]';
export const TAG_API: string = '[Sample_CustomInputText_Api]';
export const TAG_UI: string = '[Sample_CustomInputText_Ui]';
export const TAG_LOGGER: string = '[Sample_CustomInputText_Logger]';

/** Sentinel used by selectByRange to mean "up to the end of the text". */
export const END_FLAG: number = 1000;
export const LINE_HEIGHT: number = 20;
export const DEFAULT_INPUT_WIDTH: number = 320;
export const CURSOR_DEFAULT_LEFT: number = 0;
export const CURSOR_DEFAULT_TOP: number = 0;
export const CURSOR_DEFAULT_WIDTH: number = 1;
export const CURSOR_DEFAULT_HEIGHT: number = 25;
export const FONT_SIZE: number = 16;
export const CURSOR_TEXT_MAX_LENGTH: number = 4;
export const SELECT_OPTION_COUNT: number = 4;
export const INPUT_TEXT_ID: string = 'inputText';
export const SELECT_INPUT_ID: string = 'selectInput';
export const LAST_INPUT_ID: string = 'lastInput';
export const CONTAINER_ID: string = 'customInputText';
export const BTN_ATTACH_ID: string = 'btnAttach';
export const BTN_SHOW_ID: string = 'btnShow';
export const BTN_ON_ID: string = 'btnOn';
export const BTN_UPDATE_CURSOR_ID: string = 'btnUpdateCursor';
export const BTN_CHANGE_SELECTION_ID: string = 'btnChangeSelection';
export const BTN_UPDATE_ATTRIBUTE_ID: string = 'btnUpdateAttribute';
export const CURSOR_LEFT_ID: string = 'cursorLeft';
export const CURSOR_TOP_ID: string = 'cursorTop';
export const CURSOR_WIDTH_ID: string = 'cursorWidth';
export const CURSOR_HEIGHT_ID: string = 'cursorHeight';
export const SELECT_START_ID: string = 'selectStart';
export const SELECT_END_ID: string = 'selectEnd';
export const INPUT_TYPE_SELECT_ID: string = 'inputTypeSelect';
export const ENTER_KEY_SELECT_ID: string = 'enterKeySelect';

export const STRING_DEFAULT_INPUT: string = 'default_input';
export const STRING_TEXT_INPUT: string = 'text_input';
export const STRING_NUMBER_INPUT: string = 'number_input';
export const STRING_PHONE_INPUT: string = 'phone_input';
export const STRING_DEFAULT_ENTER_KEY: string = 'default_enter_key';
export const STRING_SEARCH_ENTER_KEY: string = 'search_enter_key';
export const STRING_SEND_ENTER_KEY: string = 'send_enter_key';
export const STRING_GO_ENTER_KEY: string = 'go_enter_key';
export const STRING_TEXT_INPUT_TYPE_TITLE: string = 'text_input_type';
export const STRING_ENTER_KEY_TYPE_TITLE: string = 'enter_key_type';
export const STRING_ATTACH: string = 'attach';
export const STRING_DETACH: string = 'detach';
export const STRING_SHOW: string = 'show';
export const STRING_HIDE: string = 'hide';
export const STRING_ON: string = 'on';
export const STRING_OFF: string = 'off';
export const STRING_NO_ATTACH_TIP: string = 'noattach_tips';

export const INPUT_TYPE_RESOURCES: string[] = [
  STRING_DEFAULT_INPUT, STRING_TEXT_INPUT, STRING_NUMBER_INPUT, STRING_PHONE_INPUT
];
export const ENTER_KEY_RESOURCES: string[] = [
  STRING_DEFAULT_ENTER_KEY, STRING_SEARCH_ENTER_KEY, STRING_SEND_ENTER_KEY, STRING_GO_ENTER_KEY
];
export const INPUT_TYPE_FALLBACK: string = STRING_TEXT_INPUT_TYPE_TITLE;
export const ENTER_KEY_FALLBACK: string = STRING_ENTER_KEY_TYPE_TITLE;
