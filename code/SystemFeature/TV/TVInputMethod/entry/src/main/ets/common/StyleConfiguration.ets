/**
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
import Log from '../model/Log';
import { StartOptions } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { DEVICE_SIZE_4K } from '../model/KeyboardController';

const TAG = 'StyleConfiguration';

export interface KeyStyle {
  deviceType?: string,
  basicButtonWidth: Resource,
  basicButtonHeight: Resource,
  featurePicSize: Resource,
  switchButtonWidth: Resource,
  returnPicSize: Resource,
  returnButtonWidthType_1: Resource,
  returnButtonWidthType_2: Resource,
  spaceButtonWidth_1: Resource,
  spaceButtonWidth_2: Resource,
  paddingTop: Resource,
  paddingLeftRight: Resource,
  downMenuHeight: Resource,
  downMenuPicWidth: Resource,
  downMenuPicHeight: Resource,
  downMenuWidth: Resource,
  litterNumberFontSize: Resource,
  enFontSize: Resource,
  symbolFontSize: Resource,
  switchNumberFontSize: Resource,
  switchNumberFontSizeG: Resource,
  number1234ontFSize?: Resource,
  chineseCandidateHeight: Resource,
  nineButtonWidth: Resource,
  nineButtonHeight: Resource,
  pinyinBarHeight: Resource,
  keyboardHeight: Resource,
  bodyHeight: Resource,
  editDriverLeft: Resource;
}

export const KEY_BOARD_TOP = 20;

export const BUTTON_WIDTH = 96.43;

export const BUTTON_HEIGHT = 70;

export const BUTTON_MARGIN_LEFT = 16;

export const BUTTON_MARGIN_BUTTON = 13;

export const BUTTON_BORDER_WIDTH = 2;

export const BUTTON_BORDER_RADIUS = 10;

export const BUTTON_TEXT_SIZE = 30;

export const KEYBOARD_WIDTH = 1333.16;

export const KEYBOARD_HEIGHT = 242;

export const LEFT_RIGHT_MARGIN = 5;

export const DIFFERENCE_VALUE = 6.5;

export interface buttonStyle {
  KEY_BOARD_TOP: number,
  BUTTON_WIDTH: number,
  BUTTON_HEIGHT: number,
  BUTTON_MARGIN_LEFT: number,
  BUTTON_MARGIN_BUTTON: number,
  BUTTON_BORDER_WIDTH: number,
  BUTTON_BORDER_RADIUS: number,
  BUTTON_TEXT_SIZE: number,
  KEYBOARD_WIDTH: number,
  KEYBOARD_HEIGHT: number,
  LEFT_RIGHT_MARGIN: number,
  DIFFERENCE_VALUE: number,
  HEIGHT_INPUT: number | string,
  DELETE_TEXT_SIZE: number,
  PINYIN_VIEW_HEIGHT: number,
  SELECT_SIZE: number;
}

export class InputStyleConfiguration {
  public static reSize() {
    InputStyleConfiguration.getSizeValue();
  }

  public static getSizeValue(): buttonStyle {
    let sizeType: number = 0;
    let dis = display.getDefaultDisplaySync();
    if (dis.width == 3840 && dis.height == 2160) {
      sizeType = 1;
      AppStorage.setOrCreate('4kSize', true);
    } else {
      AppStorage.setOrCreate('4kSize', false);
    }
    if (sizeType === 1) {
      return {
        KEY_BOARD_TOP: 20,

        BUTTON_WIDTH: 210.43,

        BUTTON_HEIGHT: 150,

        BUTTON_MARGIN_LEFT: 16,

        BUTTON_MARGIN_BUTTON: 13,

        BUTTON_BORDER_WIDTH: 2,

        BUTTON_BORDER_RADIUS: 10,

        BUTTON_TEXT_SIZE: 40,

        KEYBOARD_WIDTH: 2800,

        KEYBOARD_HEIGHT: 502,

        LEFT_RIGHT_MARGIN: 20,

        DIFFERENCE_VALUE: 6.5,

        HEIGHT_INPUT: '100%',

        DELETE_TEXT_SIZE: 32,

        PINYIN_VIEW_HEIGHT: 32,

        SELECT_SIZE: 55
      }
    } else {
      return {
        KEY_BOARD_TOP: 20,

        BUTTON_WIDTH: 96.43,

        BUTTON_HEIGHT: 70,

        BUTTON_MARGIN_LEFT: 16,

        BUTTON_MARGIN_BUTTON: 13,

        BUTTON_BORDER_WIDTH: 2,

        BUTTON_BORDER_RADIUS: 10,

        BUTTON_TEXT_SIZE: 20,

        KEYBOARD_WIDTH: 1333.16,

        KEYBOARD_HEIGHT: 242,

        LEFT_RIGHT_MARGIN: 5,

        DIFFERENCE_VALUE: 6.5,

        HEIGHT_INPUT: 377,

        DELETE_TEXT_SIZE: 21,

        PINYIN_VIEW_HEIGHT: 32,

        SELECT_SIZE: 35
      }
    }
  }
}


export class StyleConfiguration {
  static getInputStyle(islandSpace: boolean, isRkDevice: boolean, deviceType: string): KeyStyle {
    Log.showInfo(TAG, `kikaInput-islandSpace===: ${islandSpace}`);
    Log.showInfo(TAG, `kikaInput-isRkDevice===: ${isRkDevice}`);
    Log.showInfo(TAG, `kikaInput-deviceType===: ${deviceType}`);
    if (isRkDevice) {
      return {
        basicButtonWidth: $r('app.float.rk_basic_button_width'),
        basicButtonHeight: $r('app.float.rk_basic_button_height'),
        featurePicSize: $r('app.float.rk_feature_picSize'),
        switchButtonWidth: $r('app.float.rk_switch_button_width'),
        returnPicSize: $r('app.float.rk_return_picSize'),
        returnButtonWidthType_1: $r('app.float.rk_return_button_widthType_1'),
        returnButtonWidthType_2: $r('app.float.rk_return_button_widthType_2'),
        spaceButtonWidth_1: $r('app.float.rk_space_button_width_1'),
        spaceButtonWidth_2: $r('app.float.rk_space_button_width_2'),
        paddingTop: $r('app.float.rk_padding_top'),
        paddingLeftRight: $r('app.float.rk_padding_left_right'),
        downMenuHeight: $r('app.float.rk_downMenu_height'),
        downMenuPicWidth: $r('app.float.rk_downMenu_pic_width'),
        downMenuPicHeight: $r('app.float.rk_downMenu_pic_height'),
        downMenuWidth: $r('app.float.rk_downMenu_width'),
        litterNumberFontSize: $r('app.float.rk_litter_number_fontSize'),
        enFontSize: $r('app.float.rk_en_fontSize'),
        symbolFontSize: $r('app.float.rk_en_fontSize'),
        switchNumberFontSize: $r('app.float.rk_switch_number_fontSize'),
        switchNumberFontSizeG: $r('app.float.rk_switch_number_fontSize_g'),
        number1234ontFSize: $r('app.float.rk_number_1234_fontSize'),
        chineseCandidateHeight: $r('app.float.rk_chinese_candidate_height'),
        nineButtonWidth: $r('app.float.rk_basic_button_width'),
        nineButtonHeight: $r('app.float.rk_basic_button_height'),
        pinyinBarHeight: $r('app.float.rk_feature_picSize'),
        bodyHeight: $r('app.float.rk_body_height'),
        keyboardHeight: $r('app.float.rk_keyboard_height'),
        editDriverLeft: $r('app.float.rk_edit_driver_left')
      }
    } else if (deviceType == 'tablet') {
      if (islandSpace) {
        return {
          deviceType: 'tablet_landSpace',
          basicButtonWidth: $r('app.float.landSpace_basic_button_width'),
          basicButtonHeight: $r('app.float.landSpace_basic_button_height'),
          featurePicSize: $r('app.float.landSpace_feature_picSize'),
          switchButtonWidth: $r('app.float.landSpace_switch_button_width'),
          returnPicSize: $r('app.float.landSpace_return_picSize'),
          returnButtonWidthType_1: $r('app.float.landSpace_return_button_widthType_1'),
          returnButtonWidthType_2: $r('app.float.landSpace_return_button_widthType_2'),
          spaceButtonWidth_1: $r('app.float.landSpace_space_button_width_1'),
          spaceButtonWidth_2: $r('app.float.landSpace_space_button_width_2'),
          paddingTop: $r('app.float.landSpace_padding_top'),
          paddingLeftRight: $r('app.float.landSpace_padding_left_right'),
          downMenuHeight: $r('app.float.landSpace_downMenu_height'),
          downMenuPicWidth: $r('app.float.landSpace_downMenu_pic_width'),
          downMenuPicHeight: $r('app.float.landSpace_downMenu_pic_height'),
          downMenuWidth: $r('app.float.landSpace_downMenu_width'),
          litterNumberFontSize: $r('app.float.landSpace_litter_number_fontSize'),
          enFontSize: $r('app.float.landSpace_en_fontSize'),
          symbolFontSize: $r('app.float.landSpace_symbol_fontSize'),
          switchNumberFontSize: $r('app.float.landSpace_switch_number_fontSize'),
          switchNumberFontSizeG: $r('app.float.landSpace_switch_number_fontSize_g'),
          chineseCandidateHeight: $r('app.float.landSpace_chinese_candidate_height'),
          nineButtonWidth: $r('app.float.landSpace_nine_button_width'),
          nineButtonHeight: $r('app.float.landSpace_nine_button_height'),
          pinyinBarHeight: $r('app.float.rk_feature_picSize'),
          bodyHeight: $r('app.float.rk_body_height'),
          keyboardHeight: $r('app.float.rk_keyboard_height'),
          editDriverLeft: $r('app.float.rk_edit_driver_left')
        }
      } else {
        return {
          deviceType: 'tablet_portrait',
          basicButtonWidth: $r('app.float.portrait_basic_button_width'),
          basicButtonHeight: $r('app.float.portrait_basic_button_height'),
          featurePicSize: $r('app.float.portrait_feature_picSize'),
          switchButtonWidth: $r('app.float.portrait_switch_button_width'),
          returnPicSize: $r('app.float.portrait_return_picSize'),
          returnButtonWidthType_1: $r('app.float.portrait_return_button_widthType_1'),
          returnButtonWidthType_2: $r('app.float.portrait_return_button_widthType_2'),
          spaceButtonWidth_1: $r('app.float.portrait_space_button_width_1'),
          spaceButtonWidth_2: $r('app.float.portrait_space_button_width_2'),
          paddingTop: $r('app.float.portrait_padding_top'),
          paddingLeftRight: $r('app.float.portrait_padding_left_right'),
          downMenuHeight: $r('app.float.portrait_downMenu_height'),
          downMenuPicWidth: $r('app.float.portrait_downMenu_pic_width'),
          downMenuPicHeight: $r('app.float.portrait_downMenu_pic_height'),
          downMenuWidth: $r('app.float.portrait_downMenu_width'),
          litterNumberFontSize: $r('app.float.portrait_litter_number_fontSize'),
          enFontSize: $r('app.float.portrait_en_fontSize'),
          symbolFontSize: $r('app.float.landSpace_symbol_fontSize'),
          switchNumberFontSize: $r('app.float.portrait_switch_number_fontSize'),
          switchNumberFontSizeG: $r('app.float.portrait_switch_number_fontSize_g'),
          chineseCandidateHeight: $r('app.float.portrait_chinese_candidate_height'),
          nineButtonWidth: $r('app.float.portrait_nine_button_width'),
          nineButtonHeight: $r('app.float.portrait_nine_button_height'),
          pinyinBarHeight: $r('app.float.rk_feature_picSize'),
          bodyHeight: $r('app.float.rk_body_height'),
          keyboardHeight: $r('app.float.rk_keyboard_height'),
          editDriverLeft: $r('app.float.rk_edit_driver_left')
        }
      }
    } else {
      if (!islandSpace) {
        return {
          basicButtonWidth: $r('app.float.s_basic_button_width'),
          basicButtonHeight: $r('app.float.s_basic_button_height'),
          featurePicSize: $r('app.float.s_feature_picSize'),
          switchButtonWidth: $r('app.float.s_switch_button_width'),
          returnPicSize: $r('app.float.return_picSize'),
          returnButtonWidthType_1: $r('app.float.s_return_button_widthType_1'),
          returnButtonWidthType_2: $r('app.float.s_return_button_widthType_2'),
          spaceButtonWidth_1: $r('app.float.s_space_button_width_1'),
          spaceButtonWidth_2: $r('app.float.s_space_button_width_2'),
          paddingTop: $r('app.float.s_padding_top'),
          paddingLeftRight: $r('app.float.s_padding_left_right'),
          downMenuHeight: $r('app.float.downMenu_height'),
          downMenuPicWidth: $r('app.float.downMenu_pic_width'),
          downMenuPicHeight: $r('app.float.downMenu_pic_height'),
          downMenuWidth: $r('app.float.downMenu_width'),
          litterNumberFontSize: $r('app.float.litter_number_fontSize'),
          enFontSize: $r('app.float.en_fontSize'),
          symbolFontSize: $r('app.float.en_fontSize'),
          switchNumberFontSize: $r('app.float.switch_number_fontSize'),
          switchNumberFontSizeG: $r('app.float.switch_number_fontSize_g'),
          number1234ontFSize: $r('app.float.number_1234_fontSize'),
          chineseCandidateHeight: $r('app.float.chinese_candidate_height'),
          nineButtonWidth: $r('app.float.s_nine_button_width'),
          nineButtonHeight: $r('app.float.s_nine_button_height'),
          pinyinBarHeight: $r('app.float.rk_feature_picSize'),
          bodyHeight: $r('app.float.rk_body_height'),
          keyboardHeight: $r('app.float.rk_keyboard_height'),
          editDriverLeft: $r('app.float.s_edit_driver_left')
        }
      } else {
        return {
          basicButtonWidth: $r('app.float.h_basic_button_width'),
          basicButtonHeight: $r('app.float.h_basic_button_height'),
          featurePicSize: $r('app.float.h_feature_picSize'),
          switchButtonWidth: $r('app.float.h_switch_button_width'),
          returnPicSize: $r('app.float.return_picSize'),
          returnButtonWidthType_1: $r('app.float.h_return_button_widthType_1'),
          returnButtonWidthType_2: $r('app.float.h_return_button_widthType_2'),
          spaceButtonWidth_1: $r('app.float.h_space_button_width_1'),
          spaceButtonWidth_2: $r('app.float.h_space_button_width_2'),
          paddingTop: $r('app.float.h_padding_top'),
          paddingLeftRight: $r('app.float.h_padding_left_right'),
          downMenuHeight: $r('app.float.downMenu_height'),
          downMenuPicWidth: $r('app.float.downMenu_pic_width'),
          downMenuPicHeight: $r('app.float.downMenu_pic_height'),
          downMenuWidth: $r('app.float.downMenu_width'),
          litterNumberFontSize: $r('app.float.litter_number_fontSize'),
          enFontSize: $r('app.float.en_fontSize'),
          symbolFontSize: $r('app.float.en_fontSize'),
          switchNumberFontSize: $r('app.float.switch_number_fontSize'),
          switchNumberFontSizeG: $r('app.float.switch_number_fontSize_g'),
          number1234ontFSize: $r('app.float.number_1234_fontSize'),
          chineseCandidateHeight: $r('app.float.chinese_candidate_height'),
          nineButtonWidth: $r('app.float.h_nine_button_width'),
          nineButtonHeight: $r('app.float.h_nine_button_height'),
          pinyinBarHeight: $r('app.float.rk_feature_picSize'),
          bodyHeight: $r('app.float.rk_body_height'),
          keyboardHeight: $r('app.float.rk_keyboard_height'),
          editDriverLeft: $r('app.float.s_edit_driver_left')
        }
      }

    }
  }
}

export enum ConstantNum {
  NUM_0_5 = 0.5,
  NUM_1 = 1,
  NUM_2 = 2,
  NUM_3 = 3,
  NUM_4 = 4,
  NUM_5 = 5,
  NUM_6 = 6,
  NUM_6_5 = 6.5,
  NUM_7 = 7,
  NUM_8 = 8,
  NUM_8_5 = 8.5,
  NUM_9 = 9,
  NUM_10 = 10,
  NUM_11 = 11,
  NUM_12 = 12,
  NUM_13 = 13,
  NUM_14 = 14,
  NUM_15 = 15,
  NUM_16 = 16,
  NUM_17 = 17,
  NUM_18 = 18,
  NUM_19 = 19,
  NUM_20 = 20,
  NUM_21 = 21,
  NUM_22 = 22,
  NUM_23 = 23,
  NUM_24 = 24,
  NUM_25 = 25,
  NUM_26 = 26,
  NUM_27 = 27,
  NUM_28 = 28,
  NUM_29 = 29,
  NUM_30 = 30,
  NUM_31 = 31,
  NUM_32 = 32,
  NUM_33 = 33,
  NUM_34 = 34,
  NUM_35 = 35,
  NUM_36 = 36,
  NUM_37 = 37,
  NUM_38 = 38,
  NUM_39 = 39,
  NUM_40 = 40,
  NUM_48 = 48,
  NUM_50 = 50,
  NUM_56 = 56,
  NUM_60 = 60,
  NUM_400 = 400,
  NUM_500 = 500
}

// 对应键盘行数
export enum FocusCol {
  COL_0 = 0,
  COL_1 = 1,
  COL_2 = 2,
  COL_3 = 3,
  COL_4 = 4
}

// 对应键盘列数
export enum FocusRow {
  ROW_0 = 0,
  ROW_1 = 1,
  ROW_2 = 2,
  ROW_3 = 3,
  ROW_4 = 4,
  ROW_5 = 5,
  ROW_6 = 6,
  ROW_7 = 7,
  ROW_8 = 8,
  ROW_9 = 9,
  ROW_10 = 10,
  ROW_11 = 11,
  ROW_12 = 12,
}

export let inputStyleConfig = InputStyleConfiguration.getSizeValue();
