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

import { colorSpaceManager } from '@kit.ArkGraphics2D';

export interface GamutPoint {
    x: number;
    y: number;
}

export interface ColorSpaceInfo {
    enumValue: colorSpaceManager.ColorSpace;
    label: string;
    redX: number;
    redY: number;
    greenX: number;
    greenY: number;
    blueX: number;
    blueY: number;
    whiteX: number;
    whiteY: number;
    gamma: number;
}

export const STANDARD_COLOR_SPACES: ColorSpaceInfo[] = [
    {
        enumValue: colorSpaceManager.ColorSpace.SRGB, label: 'SRGB',
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.DISPLAY_P3, label: 'Display_P3',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.DCI_P3, label: 'DCI_P3',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.314, whiteY: 0.351, gamma: 2.6
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT2020_HLG, label: 'BT2020_HLG',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT2020_PQ, label: 'BT2020_PQ',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT709, label: 'BT709',
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.ADOBE_RGB_1998, label: 'Adobe_RGB_1998',
        redX: 0.64, redY: 0.33, greenX: 0.21, greenY: 0.71, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.LINEAR_SRGB, label: 'Linear_SRGB',
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 1.0
    }
];

export function getColorSpaceNameStr(csName: colorSpaceManager.ColorSpace): string {
    let nameStr: string = `Unknown(${csName})`;
    if (csName === colorSpaceManager.ColorSpace.SRGB) {
        nameStr = 'SRGB';
    } else if (csName === colorSpaceManager.ColorSpace.DISPLAY_P3) {
        nameStr = 'Display_P3';
    } else if (csName === colorSpaceManager.ColorSpace.DCI_P3) {
        nameStr = 'DCI_P3';
    } else if (csName === colorSpaceManager.ColorSpace.BT2020_HLG) {
        nameStr = 'BT2020_HLG';
    } else if (csName === colorSpaceManager.ColorSpace.BT2020_PQ) {
        nameStr = 'BT2020_PQ';
    } else if (csName === colorSpaceManager.ColorSpace.ADOBE_RGB_1998) {
        nameStr = 'Adobe_RGB_1998';
    } else if (csName === colorSpaceManager.ColorSpace.CUSTOM) {
        nameStr = 'Custom';
    } else if (csName === colorSpaceManager.ColorSpace.BT709) {
        nameStr = 'BT709';
    } else if (csName === colorSpaceManager.ColorSpace.LINEAR_SRGB) {
        nameStr = 'Linear_SRGB';
    } else if (csName === colorSpaceManager.ColorSpace.BT601_EBU) {
        nameStr = 'BT601_EBU';
    } else if (csName === colorSpaceManager.ColorSpace.BT601_SMPTE_C) {
        nameStr = 'BT601_SMPTE_C';
    } else if (csName === colorSpaceManager.ColorSpace.P3_HLG) {
        nameStr = 'P3_HLG';
    } else if (csName === colorSpaceManager.ColorSpace.P3_PQ) {
        nameStr = 'P3_PQ';
    } else if (csName === colorSpaceManager.ColorSpace.LINEAR_BT2020) {
        nameStr = 'Linear_BT2020';
    } else if (csName === colorSpaceManager.ColorSpace.H_LOG) {
        nameStr = 'H_LOG';
    } else if (csName === colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB) {
        nameStr = 'Display_BT2020_SRGB';
    } else if (csName === colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT) {
        nameStr = 'Adobe_RGB_1998_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT) {
        nameStr = 'Display_P3_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.SRGB_LIMIT) {
        nameStr = 'SRGB_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.BT709_LIMIT) {
        nameStr = 'BT709_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.BT601_EBU_LIMIT) {
        nameStr = 'BT601_EBU_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT) {
        nameStr = 'BT601_SMPTE_C_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT) {
        nameStr = 'BT2020_HLG_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT) {
        nameStr = 'BT2020_PQ_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.P3_HLG_LIMIT) {
        nameStr = 'P3_HLG_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.P3_PQ_LIMIT) {
        nameStr = 'P3_PQ_Limit';
    } else if (csName === colorSpaceManager.ColorSpace.LINEAR_P3) {
        nameStr = 'Linear_P3';
    }
    return nameStr;
}

// Extended Full-range color spaces (API 11+)
export const EXTENDED_COLOR_SPACES: ColorSpaceInfo[] = [
    {
        enumValue: colorSpaceManager.ColorSpace.BT601_EBU, label: 'BT601_EBU',
        redX: 0.64, redY: 0.33, greenX: 0.29, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT601_SMPTE_C, label: 'BT601_SMPTE_C',
        redX: 0.630, redY: 0.340, greenX: 0.310, greenY: 0.595, blueX: 0.155, blueY: 0.070,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.P3_HLG, label: 'P3_HLG',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.P3_PQ, label: 'P3_PQ',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.LINEAR_BT2020, label: 'Linear_BT2020',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 1.0
    },
    {
        enumValue: colorSpaceManager.ColorSpace.H_LOG, label: 'H_LOG',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB, label: 'Display_BT2020',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    }
];

// LIMIT range color spaces (API 11+)
export const LIMIT_COLOR_SPACES: ColorSpaceInfo[] = [
    {
        enumValue: colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT, label: 'Adobe_RGB_Limit',
        redX: 0.64, redY: 0.33, greenX: 0.21, greenY: 0.71, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT, label: 'Display_P3_Limit',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.SRGB_LIMIT, label: 'SRGB_Limit',
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT709_LIMIT, label: 'BT709_Limit',
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT601_EBU_LIMIT, label: 'BT601_EBU_Limit',
        redX: 0.64, redY: 0.33, greenX: 0.29, greenY: 0.60, blueX: 0.15, blueY: 0.06,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT, label: 'BT601_SMPTE_Limit',
        redX: 0.630, redY: 0.340, greenX: 0.310, greenY: 0.595, blueX: 0.155, blueY: 0.070,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT, label: 'BT2020_HLG_Limit',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT, label: 'BT2020_PQ_Limit',
        redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.P3_HLG_LIMIT, label: 'P3_HLG_Limit',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.P3_PQ_LIMIT, label: 'P3_PQ_Limit',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 2.2
    },
    {
        enumValue: colorSpaceManager.ColorSpace.LINEAR_P3, label: 'Linear_P3',
        redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
        whiteX: 0.3127, whiteY: 0.3290, gamma: 1.0
    }
];

export function getAllColorSpaces(): ColorSpaceInfo[] {
    let all: ColorSpaceInfo[] = [];
    for (let i = 0; i < STANDARD_COLOR_SPACES.length; i++) {
        all.push(STANDARD_COLOR_SPACES[i]);
    }
    for (let i = 0; i < EXTENDED_COLOR_SPACES.length; i++) {
        all.push(EXTENDED_COLOR_SPACES[i]);
    }
    for (let i = 0; i < LIMIT_COLOR_SPACES.length; i++) {
        all.push(LIMIT_COLOR_SPACES[i]);
    }
    return all;
}

export function findColorSpaceInfo(enumValue: colorSpaceManager.ColorSpace): ColorSpaceInfo | null {
    for (let i = 0; i < STANDARD_COLOR_SPACES.length; i++) {
        if (STANDARD_COLOR_SPACES[i].enumValue === enumValue) {
            return STANDARD_COLOR_SPACES[i];
        }
    }
    for (let i = 0; i < EXTENDED_COLOR_SPACES.length; i++) {
        if (EXTENDED_COLOR_SPACES[i].enumValue === enumValue) {
            return EXTENDED_COLOR_SPACES[i];
        }
    }
    for (let i = 0; i < LIMIT_COLOR_SPACES.length; i++) {
        if (LIMIT_COLOR_SPACES[i].enumValue === enumValue) {
            return LIMIT_COLOR_SPACES[i];
        }
    }
    return null;
}
