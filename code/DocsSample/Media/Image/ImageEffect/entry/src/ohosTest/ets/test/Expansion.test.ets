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

import { afterEach, describe, it } from '@ohos/hypium';

import runEffectNoRenderTarget001 from './expansion/EffectStartWithoutInitialization.test';
import runEffectNoRenderTarget002 from './expansion/EffectStopWithoutInitialization.test';
import runEffectBuffer001 from './expansion/EffectBufferInput001.test';
import runEffectBuffer002 from './expansion/EffectBufferInput002.test';
import runEffectBuffer003 from './expansion/EffectBufferInput003.test';
import runEffectBuffer004 from './expansion/EffectBufferInput004.test';
import runEffectBuffer005 from './expansion/EffectBufferInput005.test';
import runEffectBuffer006 from './expansion/EffectBufferInput006.test';
import runEffectBuffer007 from './expansion/EffectBufferInput007.test';
import runEffectBuffer008 from './expansion/EffectBufferInput008.test';
import runEffectBuffer009 from './expansion/EffectBufferInput009.test';
import runEffectBuffer010 from './expansion/EffectBufferInput010.test';
import runEffectBuffer011 from './expansion/EffectBufferInput011.test';
import runEffectBuiltin001 from './expansion/EffectBuiltinFilter001.test';
import runEffectBuiltin002 from './expansion/EffectBuiltinFilter002.test';
import runEffectBuiltin003 from './expansion/EffectBuiltinFilter003.test';
import runEffectBuiltin004 from './expansion/EffectBuiltinFilter004.test';
import runEffectBuiltin005 from './expansion/EffectBuiltinFilter005.test';
import runEffectBuiltin006 from './expansion/EffectBuiltinFilter006.test';
import runEffectBuiltin007 from './expansion/EffectBuiltinFilter007.test';
import runEffectBuiltin008 from './expansion/EffectBuiltinFilter008.test';
import runEffectBuiltin009 from './expansion/EffectBuiltinFilter009.test';
import runEffectBuiltin010 from './expansion/EffectBuiltinFilter010.test';
import runEffectChain001 from './expansion/EffectFilterChain001.test';
import runEffectChain002 from './expansion/EffectFilterChain002.test';
import runEffectChain003 from './expansion/EffectFilterChain003.test';
import runEffectChain004 from './expansion/EffectFilterChain004.test';
import runEffectChain005 from './expansion/EffectFilterChain005.test';
import runEffectChain006 from './expansion/EffectFilterChain006.test';
import runEffectChain007 from './expansion/EffectFilterChain007.test';
import runEffectChain008 from './expansion/EffectFilterChain008.test';
import runEffectCrop001 from './expansion/EffectBuiltinCrop001.test';
import runEffectCrop002 from './expansion/EffectBuiltinCrop002.test';
import runEffectCrop003 from './expansion/EffectBuiltinCrop003.test';
import runEffectCrop004 from './expansion/EffectBuiltinCrop004.test';
import runEffectCustomBrightness001 from './expansion/EffectCustomBrightness001.test';
import runEffectCustomBrightness002 from './expansion/EffectCustomBrightness002.test';
import runEffectCustomBrightness003 from './expansion/EffectCustomBrightness003.test';
import runEffectCustomBrightness004 from './expansion/EffectCustomBrightness004.test';
import runEffectCustomBrightness005 from './expansion/EffectCustomBrightness005.test';
import runEffectCustomBrightness006 from './expansion/EffectCustomBrightness006.test';
import runEffectCustomBrightness007 from './expansion/EffectCustomBrightness007.test';
import runEffectCustomBrightness008 from './expansion/EffectCustomBrightness008.test';
import runEffectCustomBrightness009 from './expansion/EffectCustomBrightness009.test';
import runEffectCustomBrightness010 from './expansion/EffectCustomBrightness010.test';
import runEffectCustomBrightness011 from './expansion/EffectCustomBrightness011.test';
import runEffectCustomBrightness012 from './expansion/EffectCustomBrightness012.test';
import runEffectCustomBrightness013 from './expansion/EffectCustomBrightness013.test';
import runEffectCustomBrightness014 from './expansion/EffectCustomBrightness014.test';
import runEffectCustomCrop001 from './expansion/EffectCustomCrop001.test';
import runEffectCustomCrop002 from './expansion/EffectCustomCrop002.test';
import runEffectCustomCrop003 from './expansion/EffectCustomCrop003.test';
import runEffectCustomCrop004 from './expansion/EffectCustomCrop004.test';
import runEffectCustomCrop005 from './expansion/EffectCustomCrop005.test';
import runEffectCustomCrop006 from './expansion/EffectCustomCrop006.test';
import runEffectCustomCrop007 from './expansion/EffectCustomCrop007.test';
import runEffectCustomCrop008 from './expansion/EffectCustomCrop008.test';
import runEffectFilterList001 from './expansion/EffectFilterList001.test';
import runEffectFilterList002 from './expansion/EffectFilterList002.test';
import runEffectFilterList003 from './expansion/EffectFilterList003.test';
import runEffectImageutils001 from './expansion/EffectImageUtilities001.test';
import runEffectImageutils002 from './expansion/EffectImageUtilities002.test';
import runEffectImageutils003 from './expansion/EffectImageUtilities003.test';
import runEffectImageutils004 from './expansion/EffectImageUtilities004.test';
import runEffectImageutils005 from './expansion/EffectImageUtilities005.test';
import runEffectInfo001 from './expansion/EffectFilterInfo001.test';
import runEffectInfo002 from './expansion/EffectFilterInfo002.test';
import runEffectInfo003 from './expansion/EffectFilterInfo003.test';
import runEffectInfo004 from './expansion/EffectFilterInfo004.test';
import runEffectInfo005 from './expansion/EffectFilterInfo005.test';
import runEffectUri001 from './expansion/EffectUriInput001.test';
import runEffectUri002 from './expansion/EffectUriInput002.test';
import runEffectUri003 from './expansion/EffectUriInput003.test';
import runEffectUri004 from './expansion/EffectUriInput004.test';
import runEffectUri005 from './expansion/EffectUriInput005.test';
import runEffectUri006 from './expansion/EffectUriInput006.test';
import runEffectUri007 from './expansion/EffectUriInput007.test';
import runEffectUri008 from './expansion/EffectUriInput008.test';
import runEffectUri009 from './expansion/EffectUriInput009.test';
import runV2EffectBuiltin0001 from './expansion/EffectBuiltinFilterMatrix0001.test';
import runV2EffectBuiltin0002 from './expansion/EffectBuiltinFilterMatrix0002.test';
import runV2EffectBuiltin0003 from './expansion/EffectBuiltinFilterMatrix0003.test';
import runV2EffectBuiltin0004 from './expansion/EffectBuiltinFilterMatrix0004.test';
import runV2EffectBuiltin0005 from './expansion/EffectBuiltinFilterMatrix0005.test';
import runV2EffectBuiltin0006 from './expansion/EffectBuiltinFilterMatrix0006.test';
import runV2EffectBuiltin0007 from './expansion/EffectBuiltinFilterMatrix0007.test';
import runV2EffectBuiltin0008 from './expansion/EffectBuiltinFilterMatrix0008.test';
import runV2EffectBuiltin0009 from './expansion/EffectBuiltinFilterMatrix0009.test';
import runV2EffectBuiltin0010 from './expansion/EffectBuiltinFilterMatrix0010.test';
import runV2EffectBuiltin0011 from './expansion/EffectBuiltinFilterMatrix0011.test';
import runV2EffectBuiltin0012 from './expansion/EffectBuiltinFilterMatrix0012.test';
import runV2EffectBuiltin0013 from './expansion/EffectBuiltinFilterMatrix0013.test';
import runV2EffectBuiltin0014 from './expansion/EffectBuiltinFilterMatrix0014.test';
import runV2EffectBuiltin0015 from './expansion/EffectBuiltinFilterMatrix0015.test';
import runV2EffectBuiltin0016 from './expansion/EffectBuiltinFilterMatrix0016.test';
import runV2EffectBuiltin0017 from './expansion/EffectBuiltinFilterMatrix0017.test';
import runV2EffectBuiltin0018 from './expansion/EffectBuiltinFilterMatrix0018.test';
import runV2EffectBuiltin0019 from './expansion/EffectBuiltinFilterMatrix0019.test';
import runV2EffectBuiltin0020 from './expansion/EffectBuiltinFilterMatrix0020.test';
import runV2EffectBuiltin0021 from './expansion/EffectBuiltinFilterMatrix0021.test';
import runV2EffectBuiltin0022 from './expansion/EffectBuiltinFilterMatrix0022.test';
import runV2EffectBuiltin0023 from './expansion/EffectBuiltinFilterMatrix0023.test';
import runV2EffectBuiltin0024 from './expansion/EffectBuiltinFilterMatrix0024.test';
import runV2EffectBuiltin0025 from './expansion/EffectBuiltinFilterMatrix0025.test';
import runV2EffectBuiltin0026 from './expansion/EffectBuiltinFilterMatrix0026.test';
import runV2EffectBuiltin0027 from './expansion/EffectBuiltinFilterMatrix0027.test';
import runV2EffectBuiltin0028 from './expansion/EffectBuiltinFilterMatrix0028.test';
import runV2EffectBuiltin0029 from './expansion/EffectBuiltinFilterMatrix0029.test';
import runV2EffectBuiltin0030 from './expansion/EffectBuiltinFilterMatrix0030.test';
import runV2EffectBuiltin0031 from './expansion/EffectBuiltinFilterMatrix0031.test';
import runV2EffectBuiltin0032 from './expansion/EffectBuiltinFilterMatrix0032.test';
import runV2EffectBuiltin0033 from './expansion/EffectBuiltinFilterMatrix0033.test';
import runV2EffectBuiltin0034 from './expansion/EffectBuiltinFilterMatrix0034.test';
import runV2EffectBuiltin0035 from './expansion/EffectBuiltinFilterMatrix0035.test';
import runV2EffectBuiltin0036 from './expansion/EffectBuiltinFilterMatrix0036.test';
import runV2EffectBuiltin0037 from './expansion/EffectBuiltinFilterMatrix0037.test';
import runV2EffectBuiltin0038 from './expansion/EffectBuiltinFilterMatrix0038.test';
import runV2EffectBuiltin0039 from './expansion/EffectBuiltinFilterMatrix0039.test';
import runV2EffectBuiltin0040 from './expansion/EffectBuiltinFilterMatrix0040.test';
import runV2EffectBuiltin0041 from './expansion/EffectBuiltinFilterMatrix0041.test';
import runV2EffectBuiltin0042 from './expansion/EffectBuiltinFilterMatrix0042.test';
import runV2EffectBuiltin0043 from './expansion/EffectBuiltinFilterMatrix0043.test';
import runV2EffectBuiltin0044 from './expansion/EffectBuiltinFilterMatrix0044.test';
import runV2EffectBuiltin0045 from './expansion/EffectBuiltinFilterMatrix0045.test';
import runV2EffectBuiltin0046 from './expansion/EffectBuiltinFilterMatrix0046.test';
import runV2EffectBuiltin0047 from './expansion/EffectBuiltinFilterMatrix0047.test';
import runV2EffectBuiltin0048 from './expansion/EffectBuiltinFilterMatrix0048.test';
import runV2EffectBuiltin0049 from './expansion/EffectBuiltinFilterMatrix0049.test';
import runV2EffectBuiltin0050 from './expansion/EffectBuiltinFilterMatrix0050.test';
import runV2EffectBuiltin0051 from './expansion/EffectBuiltinFilterMatrix0051.test';
import runV2EffectBuiltin0052 from './expansion/EffectBuiltinFilterMatrix0052.test';
import runV2EffectBuiltin0053 from './expansion/EffectBuiltinFilterMatrix0053.test';
import runV2EffectBuiltin0054 from './expansion/EffectBuiltinFilterMatrix0054.test';
import runV2EffectBuiltin0055 from './expansion/EffectBuiltinFilterMatrix0055.test';
import runV2EffectBuiltin0056 from './expansion/EffectBuiltinFilterMatrix0056.test';
import runV2EffectBuiltin0057 from './expansion/EffectBuiltinFilterMatrix0057.test';
import runV2EffectBuiltin0058 from './expansion/EffectBuiltinFilterMatrix0058.test';
import runV2EffectBuiltin0059 from './expansion/EffectBuiltinFilterMatrix0059.test';
import runV2EffectBuiltin0060 from './expansion/EffectBuiltinFilterMatrix0060.test';
import runV2EffectBuiltin0061 from './expansion/EffectBuiltinFilterMatrix0061.test';
import runV2EffectBuiltin0062 from './expansion/EffectBuiltinFilterMatrix0062.test';
import runV2EffectBuiltin0063 from './expansion/EffectBuiltinFilterMatrix0063.test';
import runV2EffectBuiltin0064 from './expansion/EffectBuiltinFilterMatrix0064.test';
import runV2EffectBuiltin0065 from './expansion/EffectBuiltinFilterMatrix0065.test';
import runV2EffectBuiltin0066 from './expansion/EffectBuiltinFilterMatrix0066.test';
import runV2EffectBuiltin0067 from './expansion/EffectBuiltinFilterMatrix0067.test';
import runV2EffectBuiltin0068 from './expansion/EffectBuiltinFilterMatrix0068.test';
import runV2EffectBuiltin0069 from './expansion/EffectBuiltinFilterMatrix0069.test';
import runV2EffectBuiltin0070 from './expansion/EffectBuiltinFilterMatrix0070.test';
import runV2EffectBuiltin0071 from './expansion/EffectBuiltinFilterMatrix0071.test';
import runV2EffectBuiltin0072 from './expansion/EffectBuiltinFilterMatrix0072.test';
import runV2EffectBuiltin0073 from './expansion/EffectBuiltinFilterMatrix0073.test';
import runV2EffectBuiltin0074 from './expansion/EffectBuiltinFilterMatrix0074.test';
import runV2EffectBuiltin0075 from './expansion/EffectBuiltinFilterMatrix0075.test';
import runV2EffectBuiltin0076 from './expansion/EffectBuiltinFilterMatrix0076.test';
import runV2EffectBuiltin0077 from './expansion/EffectBuiltinFilterMatrix0077.test';
import runV2EffectBuiltin0078 from './expansion/EffectBuiltinFilterMatrix0078.test';
import runV2EffectBuiltin0079 from './expansion/EffectBuiltinFilterMatrix0079.test';
import runV2EffectBuiltin0080 from './expansion/EffectBuiltinFilterMatrix0080.test';
import runV2EffectBuiltin0081 from './expansion/EffectBuiltinFilterMatrix0081.test';
import runV2EffectBuiltin0082 from './expansion/EffectBuiltinFilterMatrix0082.test';
import runV2EffectBuiltin0083 from './expansion/EffectBuiltinFilterMatrix0083.test';
import runV2EffectBuiltin0084 from './expansion/EffectBuiltinFilterMatrix0084.test';
import runV2EffectBuiltin0085 from './expansion/EffectBuiltinFilterMatrix0085.test';
import runV2EffectBuiltin0086 from './expansion/EffectBuiltinFilterMatrix0086.test';
import runV2EffectBuiltin0087 from './expansion/EffectBuiltinFilterMatrix0087.test';
import runV2EffectBuiltin0088 from './expansion/EffectBuiltinFilterMatrix0088.test';
import runV2EffectBuiltin0089 from './expansion/EffectBuiltinFilterMatrix0089.test';
import runV2EffectBuiltin0090 from './expansion/EffectBuiltinFilterMatrix0090.test';
import runV2EffectBuiltin0091 from './expansion/EffectBuiltinFilterMatrix0091.test';
import runV2EffectBuiltin0092 from './expansion/EffectBuiltinFilterMatrix0092.test';
import runV2EffectBuiltin0093 from './expansion/EffectBuiltinFilterMatrix0093.test';
import runV2EffectBuiltin0094 from './expansion/EffectBuiltinFilterMatrix0094.test';
import runV2EffectBuiltin0095 from './expansion/EffectBuiltinFilterMatrix0095.test';
import runV2EffectBuiltin0096 from './expansion/EffectBuiltinFilterMatrix0096.test';
import runV2EffectBuiltin0097 from './expansion/EffectBuiltinFilterMatrix0097.test';
import runV2EffectBuiltin0098 from './expansion/EffectBuiltinFilterMatrix0098.test';
import runV2EffectBuiltin0099 from './expansion/EffectBuiltinFilterMatrix0099.test';
import runV2EffectBuiltin0100 from './expansion/EffectBuiltinFilterMatrix0100.test';
import runV2EffectBuiltin0101 from './expansion/EffectBuiltinFilterMatrix0101.test';
import runV2EffectBuiltin0102 from './expansion/EffectBuiltinFilterMatrix0102.test';
import runV2EffectBuiltin0103 from './expansion/EffectBuiltinFilterMatrix0103.test';
import runV2EffectBuiltin0104 from './expansion/EffectBuiltinFilterMatrix0104.test';
import runV2EffectBuiltin0105 from './expansion/EffectBuiltinFilterMatrix0105.test';
import runV2EffectBuiltin0106 from './expansion/EffectBuiltinFilterMatrix0106.test';
import runV2EffectBuiltin0107 from './expansion/EffectBuiltinFilterMatrix0107.test';
import runV2EffectBuiltin0108 from './expansion/EffectBuiltinFilterMatrix0108.test';
import runV2EffectChain0001 from './expansion/EffectChainOrderMatrix0001.test';
import runV2EffectChain0002 from './expansion/EffectChainOrderMatrix0002.test';
import runV2EffectChain0003 from './expansion/EffectChainOrderMatrix0003.test';
import runV2EffectChain0004 from './expansion/EffectChainOrderMatrix0004.test';
import runV2EffectChain0005 from './expansion/EffectChainOrderMatrix0005.test';
import runV2EffectChain0006 from './expansion/EffectChainOrderMatrix0006.test';
import runV2EffectChain0007 from './expansion/EffectChainOrderMatrix0007.test';
import runV2EffectChain0008 from './expansion/EffectChainOrderMatrix0008.test';
import runV2EffectChain0009 from './expansion/EffectChainOrderMatrix0009.test';
import runV2EffectChain0010 from './expansion/EffectChainOrderMatrix0010.test';
import runV2EffectChain0011 from './expansion/EffectChainOrderMatrix0011.test';
import runV2EffectChain0012 from './expansion/EffectChainOrderMatrix0012.test';
import runV2EffectChain0013 from './expansion/EffectChainOrderMatrix0013.test';
import runV2EffectChain0014 from './expansion/EffectChainOrderMatrix0014.test';
import runV2EffectChain0015 from './expansion/EffectChainOrderMatrix0015.test';
import runV2EffectChain0016 from './expansion/EffectChainOrderMatrix0016.test';
import runV2EffectChain0017 from './expansion/EffectChainOrderMatrix0017.test';
import runV2EffectChain0018 from './expansion/EffectChainOrderMatrix0018.test';
import runV2EffectChain0019 from './expansion/EffectChainOrderMatrix0019.test';
import runV2EffectChain0020 from './expansion/EffectChainOrderMatrix0020.test';
import runV2EffectChain0021 from './expansion/EffectChainOrderMatrix0021.test';
import runV2EffectChain0022 from './expansion/EffectChainOrderMatrix0022.test';
import runV2EffectChain0023 from './expansion/EffectChainOrderMatrix0023.test';
import runV2EffectChain0024 from './expansion/EffectChainOrderMatrix0024.test';
import runV2EffectChain0025 from './expansion/EffectChainOrderMatrix0025.test';
import runV2EffectChain0026 from './expansion/EffectChainOrderMatrix0026.test';
import runV2EffectChain0027 from './expansion/EffectChainOrderMatrix0027.test';
import runV2EffectChain0028 from './expansion/EffectChainOrderMatrix0028.test';
import runV2EffectChain0029 from './expansion/EffectChainOrderMatrix0029.test';
import runV2EffectChain0030 from './expansion/EffectChainOrderMatrix0030.test';
import runV2EffectChain0031 from './expansion/EffectChainOrderMatrix0031.test';
import runV2EffectChain0032 from './expansion/EffectChainOrderMatrix0032.test';
import runV2EffectChain0033 from './expansion/EffectChainOrderMatrix0033.test';
import runV2EffectCrop0001 from './expansion/EffectCropRegionMatrix0001.test';
import runV2EffectCrop0002 from './expansion/EffectCropRegionMatrix0002.test';
import runV2EffectCrop0003 from './expansion/EffectCropRegionMatrix0003.test';
import runV2EffectCrop0004 from './expansion/EffectCropRegionMatrix0004.test';
import runV2EffectCrop0005 from './expansion/EffectCropRegionMatrix0005.test';
import runV2EffectCrop0006 from './expansion/EffectCropRegionMatrix0006.test';
import runV2EffectCrop0007 from './expansion/EffectCropRegionMatrix0007.test';
import runV2EffectCrop0008 from './expansion/EffectCropRegionMatrix0008.test';
import runV2EffectCrop0009 from './expansion/EffectCropRegionMatrix0009.test';
import runV2EffectCrop0010 from './expansion/EffectCropRegionMatrix0010.test';
import runV2EffectCrop0011 from './expansion/EffectCropRegionMatrix0011.test';
import runV2EffectCrop0012 from './expansion/EffectCropRegionMatrix0012.test';
import runV2EffectCrop0013 from './expansion/EffectCropRegionMatrix0013.test';
import runV2EffectCrop0014 from './expansion/EffectCropRegionMatrix0014.test';
import runV2EffectCrop0015 from './expansion/EffectCropRegionMatrix0015.test';
import runV2EffectCrop0016 from './expansion/EffectCropRegionMatrix0016.test';
import runV2EffectCrop0017 from './expansion/EffectCropRegionMatrix0017.test';
import runV2EffectCrop0018 from './expansion/EffectCropRegionMatrix0018.test';
import runV2EffectCrop0019 from './expansion/EffectCropRegionMatrix0019.test';
import runV2EffectCrop0020 from './expansion/EffectCropRegionMatrix0020.test';
import runV2EffectCrop0021 from './expansion/EffectCropRegionMatrix0021.test';
import runV2EffectCrop0022 from './expansion/EffectCropRegionMatrix0022.test';
import runV2EffectCrop0023 from './expansion/EffectCropRegionMatrix0023.test';
import runV2EffectCrop0024 from './expansion/EffectCropRegionMatrix0024.test';
import runV2EffectCrop0025 from './expansion/EffectCropRegionMatrix0025.test';
import runV2EffectCrop0026 from './expansion/EffectCropRegionMatrix0026.test';
import runV2EffectCrop0027 from './expansion/EffectCropRegionMatrix0027.test';
import runV2EffectCrop0028 from './expansion/EffectCropRegionMatrix0028.test';
import runV2EffectCrop0029 from './expansion/EffectCropRegionMatrix0029.test';
import runV2EffectCrop0030 from './expansion/EffectCropRegionMatrix0030.test';
import runV2EffectCrop0031 from './expansion/EffectCropRegionMatrix0031.test';
import runV2EffectCrop0032 from './expansion/EffectCropRegionMatrix0032.test';
import runV2EffectCrop0033 from './expansion/EffectCropRegionMatrix0033.test';
import runV2EffectCrop0034 from './expansion/EffectCropRegionMatrix0034.test';
import runV2EffectCrop0035 from './expansion/EffectCropRegionMatrix0035.test';
import runV2EffectCrop0036 from './expansion/EffectCropRegionMatrix0036.test';
import runV2EffectCrop0037 from './expansion/EffectCropRegionMatrix0037.test';
import runV2EffectCrop0038 from './expansion/EffectCropRegionMatrix0038.test';
import runV2EffectCrop0039 from './expansion/EffectCropRegionMatrix0039.test';
import runV2EffectCrop0040 from './expansion/EffectCropRegionMatrix0040.test';
import runV2EffectCrop0041 from './expansion/EffectCropRegionMatrix0041.test';
import runV2EffectCrop0042 from './expansion/EffectCropRegionMatrix0042.test';
import runV2EffectCrop0043 from './expansion/EffectCropRegionMatrix0043.test';
import runV2EffectCrop0044 from './expansion/EffectCropRegionMatrix0044.test';
import runV2EffectCrop0045 from './expansion/EffectCropRegionMatrix0045.test';
import runV2EffectCrop0046 from './expansion/EffectCropRegionMatrix0046.test';
import runV2EffectCrop0047 from './expansion/EffectCropRegionMatrix0047.test';
import runV2EffectCrop0048 from './expansion/EffectCropRegionMatrix0048.test';
import runV2EffectCrop0049 from './expansion/EffectCropRegionMatrix0049.test';
import runV2EffectCrop0050 from './expansion/EffectCropRegionMatrix0050.test';
import runV2EffectCrop0051 from './expansion/EffectCropRegionMatrix0051.test';
import runV2EffectCrop0052 from './expansion/EffectCropRegionMatrix0052.test';
import runV2EffectCrop0053 from './expansion/EffectCropRegionMatrix0053.test';
import runV2EffectCrop0054 from './expansion/EffectCropRegionMatrix0054.test';
import runV2EffectCrop0055 from './expansion/EffectCropRegionMatrix0055.test';
import runV2EffectCrop0056 from './expansion/EffectCropRegionMatrix0056.test';
import runV2EffectCrop0057 from './expansion/EffectCropRegionMatrix0057.test';
import runV2EffectCrop0058 from './expansion/EffectCropRegionMatrix0058.test';
import runV2EffectCrop0059 from './expansion/EffectCropRegionMatrix0059.test';
import runV2EffectCrop0060 from './expansion/EffectCropRegionMatrix0060.test';
import runV2EffectCrop0061 from './expansion/EffectCropRegionMatrix0061.test';
import runV2EffectCrop0062 from './expansion/EffectCropRegionMatrix0062.test';
import runV2EffectCrop0063 from './expansion/EffectCropRegionMatrix0063.test';
import runV2EffectCrop0064 from './expansion/EffectCropRegionMatrix0064.test';
import runV2EffectDecode0001 from './expansion/EffectImageDecodeMatrix0001.test';
import runV2EffectDecode0002 from './expansion/EffectImageDecodeMatrix0002.test';
import runV2EffectDecode0003 from './expansion/EffectImageDecodeMatrix0003.test';
import runV2EffectDecode0004 from './expansion/EffectImageDecodeMatrix0004.test';
import runV2EffectDecode0005 from './expansion/EffectImageDecodeMatrix0005.test';
import runV2EffectDecode0006 from './expansion/EffectImageDecodeMatrix0006.test';
import runV2EffectDecode0007 from './expansion/EffectImageDecodeMatrix0007.test';
import runV2EffectDecode0008 from './expansion/EffectImageDecodeMatrix0008.test';
import runV2EffectDecode0009 from './expansion/EffectImageDecodeMatrix0009.test';
import runV2EffectDecode0010 from './expansion/EffectImageDecodeMatrix0010.test';
import runV2EffectDecode0011 from './expansion/EffectImageDecodeMatrix0011.test';
import runV2EffectDecode0012 from './expansion/EffectImageDecodeMatrix0012.test';
import runV2EffectDecode0013 from './expansion/EffectImageDecodeMatrix0013.test';
import runV2EffectDecode0014 from './expansion/EffectImageDecodeMatrix0014.test';
import runV2EffectDecode0015 from './expansion/EffectImageDecodeMatrix0015.test';
import runV2EffectDecode0016 from './expansion/EffectImageDecodeMatrix0016.test';
import runV2EffectDecode0017 from './expansion/EffectImageDecodeMatrix0017.test';
import runV2EffectDecode0018 from './expansion/EffectImageDecodeMatrix0018.test';
import runV2EffectDecode0019 from './expansion/EffectImageDecodeMatrix0019.test';
import runV2EffectDecode0020 from './expansion/EffectImageDecodeMatrix0020.test';
import runV2EffectSolid0001 from './expansion/EffectSolidColorMatrix0001.test';
import runV2EffectSolid0002 from './expansion/EffectSolidColorMatrix0002.test';
import runV2EffectSolid0003 from './expansion/EffectSolidColorMatrix0003.test';
import runV2EffectSolid0004 from './expansion/EffectSolidColorMatrix0004.test';
import runV2EffectSolid0005 from './expansion/EffectSolidColorMatrix0005.test';
import runV2EffectSolid0006 from './expansion/EffectSolidColorMatrix0006.test';
import runV2EffectSolid0007 from './expansion/EffectSolidColorMatrix0007.test';
import runV2EffectSolid0008 from './expansion/EffectSolidColorMatrix0008.test';
import runV2EffectSolid0009 from './expansion/EffectSolidColorMatrix0009.test';
import runV2EffectSolid0010 from './expansion/EffectSolidColorMatrix0010.test';
import runV2EffectSolid0011 from './expansion/EffectSolidColorMatrix0011.test';
import runV2EffectSolid0012 from './expansion/EffectSolidColorMatrix0012.test';
import runV2EffectSolid0013 from './expansion/EffectSolidColorMatrix0013.test';
import runV2EffectSolid0014 from './expansion/EffectSolidColorMatrix0014.test';
import runV2EffectSolid0015 from './expansion/EffectSolidColorMatrix0015.test';
import runV2EffectSolid0016 from './expansion/EffectSolidColorMatrix0016.test';
import runV2EffectSolid0017 from './expansion/EffectSolidColorMatrix0017.test';
import runV2EffectSolid0018 from './expansion/EffectSolidColorMatrix0018.test';
import runV2EffectSolid0019 from './expansion/EffectSolidColorMatrix0019.test';
import runV2EffectSolid0020 from './expansion/EffectSolidColorMatrix0020.test';
import runV2EffectSolid0021 from './expansion/EffectSolidColorMatrix0021.test';
import runV2EffectSolid0022 from './expansion/EffectSolidColorMatrix0022.test';
import runV2EffectSolid0023 from './expansion/EffectSolidColorMatrix0023.test';
import runV2EffectSolid0024 from './expansion/EffectSolidColorMatrix0024.test';
import runV2EffectSolid0025 from './expansion/EffectSolidColorMatrix0025.test';
import runV2EffectSolid0026 from './expansion/EffectSolidColorMatrix0026.test';
import runV2EffectSolid0027 from './expansion/EffectSolidColorMatrix0027.test';
import runV2EffectSolid0028 from './expansion/EffectSolidColorMatrix0028.test';
import runV2EffectSolid0029 from './expansion/EffectSolidColorMatrix0029.test';
import runV2EffectSolid0030 from './expansion/EffectSolidColorMatrix0030.test';
import runV2EffectSolid0031 from './expansion/EffectSolidColorMatrix0031.test';
import runV2EffectSolid0032 from './expansion/EffectSolidColorMatrix0032.test';
import runV2EffectSolid0033 from './expansion/EffectSolidColorMatrix0033.test';
import runV2EffectSolid0034 from './expansion/EffectSolidColorMatrix0034.test';
import runV2EffectSolid0035 from './expansion/EffectSolidColorMatrix0035.test';
import runV2EffectSolid0036 from './expansion/EffectSolidColorMatrix0036.test';
import runV2EffectSolid0037 from './expansion/EffectSolidColorMatrix0037.test';
import runV2EffectSolid0038 from './expansion/EffectSolidColorMatrix0038.test';
import runV2EffectSolid0039 from './expansion/EffectSolidColorMatrix0039.test';
import runV2EffectSolid0040 from './expansion/EffectSolidColorMatrix0040.test';
import runV2EffectSolid0041 from './expansion/EffectSolidColorMatrix0041.test';
import runV2EffectSolid0042 from './expansion/EffectSolidColorMatrix0042.test';
import runV2EffectSolid0043 from './expansion/EffectSolidColorMatrix0043.test';
import runV2EffectSolid0044 from './expansion/EffectSolidColorMatrix0044.test';
import runV2EffectSolid0045 from './expansion/EffectSolidColorMatrix0045.test';
import runV2EffectSolid0046 from './expansion/EffectSolidColorMatrix0046.test';
import runV2EffectSolid0047 from './expansion/EffectSolidColorMatrix0047.test';
import runV2EffectSolid0048 from './expansion/EffectSolidColorMatrix0048.test';
import runV2EffectSolid0049 from './expansion/EffectSolidColorMatrix0049.test';
import runV2EffectSolid0050 from './expansion/EffectSolidColorMatrix0050.test';
import runV2EffectSolid0051 from './expansion/EffectSolidColorMatrix0051.test';
import runV2EffectSolid0052 from './expansion/EffectSolidColorMatrix0052.test';
import runV2EffectSolid0053 from './expansion/EffectSolidColorMatrix0053.test';
import runV2EffectSolid0054 from './expansion/EffectSolidColorMatrix0054.test';
import runV2EffectSolid0055 from './expansion/EffectSolidColorMatrix0055.test';
import runV2EffectSolid0056 from './expansion/EffectSolidColorMatrix0056.test';
import runV2EffectSolid0057 from './expansion/EffectSolidColorMatrix0057.test';
import runV2EffectSolid0058 from './expansion/EffectSolidColorMatrix0058.test';
import runV2EffectSolid0059 from './expansion/EffectSolidColorMatrix0059.test';
import runV2EffectSolid0060 from './expansion/EffectSolidColorMatrix0060.test';
import runV2EffectSolid0061 from './expansion/EffectSolidColorMatrix0061.test';
import runV2EffectSolid0062 from './expansion/EffectSolidColorMatrix0062.test';
import runV2EffectSolid0063 from './expansion/EffectSolidColorMatrix0063.test';
import runV2EffectSolid0064 from './expansion/EffectSolidColorMatrix0064.test';
import runV2EffectSolid0065 from './expansion/EffectSolidColorMatrix0065.test';
import runV2EffectSolid0066 from './expansion/EffectSolidColorMatrix0066.test';
import runV2EffectSolid0067 from './expansion/EffectSolidColorMatrix0067.test';
import runV2EffectSolid0068 from './expansion/EffectSolidColorMatrix0068.test';
import runV2EffectSolid0069 from './expansion/EffectSolidColorMatrix0069.test';
import runV2EffectSolid0070 from './expansion/EffectSolidColorMatrix0070.test';
import runV2EffectSolid0071 from './expansion/EffectSolidColorMatrix0071.test';
import runV2EffectSolid0072 from './expansion/EffectSolidColorMatrix0072.test';
import runV2EffectSolid0073 from './expansion/EffectSolidColorMatrix0073.test';
import runV2EffectSolid0074 from './expansion/EffectSolidColorMatrix0074.test';
import runV2EffectSolid0075 from './expansion/EffectSolidColorMatrix0075.test';
import runV2EffectSolid0076 from './expansion/EffectSolidColorMatrix0076.test';
import runV2EffectSolid0077 from './expansion/EffectSolidColorMatrix0077.test';
import runV2EffectSolid0078 from './expansion/EffectSolidColorMatrix0078.test';
import runV2EffectSolid0079 from './expansion/EffectSolidColorMatrix0079.test';
import runV2EffectSolid0080 from './expansion/EffectSolidColorMatrix0080.test';
import runV2EffectSolid0081 from './expansion/EffectSolidColorMatrix0081.test';
import runV2EffectSolid0082 from './expansion/EffectSolidColorMatrix0082.test';
import runV2EffectSolid0083 from './expansion/EffectSolidColorMatrix0083.test';
import runV2EffectSolid0084 from './expansion/EffectSolidColorMatrix0084.test';
import runV2EffectSolid0085 from './expansion/EffectSolidColorMatrix0085.test';
import runV2EffectSolid0086 from './expansion/EffectSolidColorMatrix0086.test';
import runV2EffectSolid0087 from './expansion/EffectSolidColorMatrix0087.test';
import runV2EffectSolid0088 from './expansion/EffectSolidColorMatrix0088.test';
import runV2EffectSolid0089 from './expansion/EffectSolidColorMatrix0089.test';
import runV2EffectSolid0090 from './expansion/EffectSolidColorMatrix0090.test';
import runV2EffectSolid0091 from './expansion/EffectSolidColorMatrix0091.test';
import runV2EffectSolid0092 from './expansion/EffectSolidColorMatrix0092.test';
import runV2EffectSolid0093 from './expansion/EffectSolidColorMatrix0093.test';
import runV2EffectSolid0094 from './expansion/EffectSolidColorMatrix0094.test';
import runV2EffectSolid0095 from './expansion/EffectSolidColorMatrix0095.test';
import runV2EffectSolid0096 from './expansion/EffectSolidColorMatrix0096.test';

/** The default entry test target registers this suite only; legacy case files are retained. */
export default function expansionTest(): void {
  describe('SourcePreservingExpansion', () => {
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 5);
      });
    });

    it('EXP_EFFECT_NO_RENDER_TARGET_001', 0, (): Promise<void> => {
      return runEffectNoRenderTarget001();
    });
    it('EXP_EFFECT_NO_RENDER_TARGET_002', 0, (): Promise<void> => {
      return runEffectNoRenderTarget002();
    });
    it('EXP_EFFECT_BUFFER_001', 0, (): Promise<void> => {
      return runEffectBuffer001();
    });
    it('EXP_EFFECT_BUFFER_002', 0, (): Promise<void> => {
      return runEffectBuffer002();
    });
    it('EXP_EFFECT_BUFFER_003', 0, (): Promise<void> => {
      return runEffectBuffer003();
    });
    it('EXP_EFFECT_BUFFER_004', 0, (): Promise<void> => {
      return runEffectBuffer004();
    });
    it('EXP_EFFECT_BUFFER_005', 0, (): Promise<void> => {
      return runEffectBuffer005();
    });
    it('EXP_EFFECT_BUFFER_006', 0, (): Promise<void> => {
      return runEffectBuffer006();
    });
    it('EXP_EFFECT_BUFFER_007', 0, (): Promise<void> => {
      return runEffectBuffer007();
    });
    it('EXP_EFFECT_BUFFER_008', 0, (): Promise<void> => {
      return runEffectBuffer008();
    });
    it('EXP_EFFECT_BUFFER_009', 0, (): Promise<void> => {
      return runEffectBuffer009();
    });
    it('EXP_EFFECT_BUFFER_010', 0, (): Promise<void> => {
      return runEffectBuffer010();
    });
    it('EXP_EFFECT_BUFFER_011', 0, (): Promise<void> => {
      return runEffectBuffer011();
    });
    it('EXP_EFFECT_BUILTIN_001', 0, (): Promise<void> => {
      return runEffectBuiltin001();
    });
    it('EXP_EFFECT_BUILTIN_002', 0, (): Promise<void> => {
      return runEffectBuiltin002();
    });
    it('EXP_EFFECT_BUILTIN_003', 0, (): Promise<void> => {
      return runEffectBuiltin003();
    });
    it('EXP_EFFECT_BUILTIN_004', 0, (): Promise<void> => {
      return runEffectBuiltin004();
    });
    it('EXP_EFFECT_BUILTIN_005', 0, (): Promise<void> => {
      return runEffectBuiltin005();
    });
    it('EXP_EFFECT_BUILTIN_006', 0, (): Promise<void> => {
      return runEffectBuiltin006();
    });
    it('EXP_EFFECT_BUILTIN_007', 0, (): Promise<void> => {
      return runEffectBuiltin007();
    });
    it('EXP_EFFECT_BUILTIN_008', 0, (): Promise<void> => {
      return runEffectBuiltin008();
    });
    it('EXP_EFFECT_BUILTIN_009', 0, (): Promise<void> => {
      return runEffectBuiltin009();
    });
    it('EXP_EFFECT_BUILTIN_010', 0, (): Promise<void> => {
      return runEffectBuiltin010();
    });
    it('EXP_EFFECT_CHAIN_001', 0, (): Promise<void> => {
      return runEffectChain001();
    });
    it('EXP_EFFECT_CHAIN_002', 0, (): Promise<void> => {
      return runEffectChain002();
    });
    it('EXP_EFFECT_CHAIN_003', 0, (): Promise<void> => {
      return runEffectChain003();
    });
    it('EXP_EFFECT_CHAIN_004', 0, (): Promise<void> => {
      return runEffectChain004();
    });
    it('EXP_EFFECT_CHAIN_005', 0, (): Promise<void> => {
      return runEffectChain005();
    });
    it('EXP_EFFECT_CHAIN_006', 0, (): Promise<void> => {
      return runEffectChain006();
    });
    it('EXP_EFFECT_CHAIN_007', 0, (): Promise<void> => {
      return runEffectChain007();
    });
    it('EXP_EFFECT_CHAIN_008', 0, (): Promise<void> => {
      return runEffectChain008();
    });
    it('EXP_EFFECT_CROP_001', 0, (): Promise<void> => {
      return runEffectCrop001();
    });
    it('EXP_EFFECT_CROP_002', 0, (): Promise<void> => {
      return runEffectCrop002();
    });
    it('EXP_EFFECT_CROP_003', 0, (): Promise<void> => {
      return runEffectCrop003();
    });
    it('EXP_EFFECT_CROP_004', 0, (): Promise<void> => {
      return runEffectCrop004();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_001', 0, (): Promise<void> => {
      return runEffectCustomBrightness001();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_002', 0, (): Promise<void> => {
      return runEffectCustomBrightness002();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_003', 0, (): Promise<void> => {
      return runEffectCustomBrightness003();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_004', 0, (): Promise<void> => {
      return runEffectCustomBrightness004();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_005', 0, (): Promise<void> => {
      return runEffectCustomBrightness005();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_006', 0, (): Promise<void> => {
      return runEffectCustomBrightness006();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_007', 0, (): Promise<void> => {
      return runEffectCustomBrightness007();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_008', 0, (): Promise<void> => {
      return runEffectCustomBrightness008();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_009', 0, (): Promise<void> => {
      return runEffectCustomBrightness009();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_010', 0, (): Promise<void> => {
      return runEffectCustomBrightness010();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_011', 0, (): Promise<void> => {
      return runEffectCustomBrightness011();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_012', 0, (): Promise<void> => {
      return runEffectCustomBrightness012();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_013', 0, (): Promise<void> => {
      return runEffectCustomBrightness013();
    });
    it('EXP_EFFECT_CUSTOM_BRIGHTNESS_014', 0, (): Promise<void> => {
      return runEffectCustomBrightness014();
    });
    it('EXP_EFFECT_CUSTOM_CROP_001', 0, (): Promise<void> => {
      return runEffectCustomCrop001();
    });
    it('EXP_EFFECT_CUSTOM_CROP_002', 0, (): Promise<void> => {
      return runEffectCustomCrop002();
    });
    it('EXP_EFFECT_CUSTOM_CROP_003', 0, (): Promise<void> => {
      return runEffectCustomCrop003();
    });
    it('EXP_EFFECT_CUSTOM_CROP_004', 0, (): Promise<void> => {
      return runEffectCustomCrop004();
    });
    it('EXP_EFFECT_CUSTOM_CROP_005', 0, (): Promise<void> => {
      return runEffectCustomCrop005();
    });
    it('EXP_EFFECT_CUSTOM_CROP_006', 0, (): Promise<void> => {
      return runEffectCustomCrop006();
    });
    it('EXP_EFFECT_CUSTOM_CROP_007', 0, (): Promise<void> => {
      return runEffectCustomCrop007();
    });
    it('EXP_EFFECT_CUSTOM_CROP_008', 0, (): Promise<void> => {
      return runEffectCustomCrop008();
    });
    it('EXP_EFFECT_FILTER_LIST_001', 0, (): Promise<void> => {
      return runEffectFilterList001();
    });
    it('EXP_EFFECT_FILTER_LIST_002', 0, (): Promise<void> => {
      return runEffectFilterList002();
    });
    it('EXP_EFFECT_FILTER_LIST_003', 0, (): Promise<void> => {
      return runEffectFilterList003();
    });
    it('EXP_EFFECT_IMAGEUTILS_001', 0, (): Promise<void> => {
      return runEffectImageutils001();
    });
    it('EXP_EFFECT_IMAGEUTILS_002', 0, (): Promise<void> => {
      return runEffectImageutils002();
    });
    it('EXP_EFFECT_IMAGEUTILS_003', 0, (): Promise<void> => {
      return runEffectImageutils003();
    });
    it('EXP_EFFECT_IMAGEUTILS_004', 0, (): Promise<void> => {
      return runEffectImageutils004();
    });
    it('EXP_EFFECT_IMAGEUTILS_005', 0, (): Promise<void> => {
      return runEffectImageutils005();
    });
    it('EXP_EFFECT_INFO_001', 0, (): Promise<void> => {
      return runEffectInfo001();
    });
    it('EXP_EFFECT_INFO_002', 0, (): Promise<void> => {
      return runEffectInfo002();
    });
    it('EXP_EFFECT_INFO_003', 0, (): Promise<void> => {
      return runEffectInfo003();
    });
    it('EXP_EFFECT_INFO_004', 0, (): Promise<void> => {
      return runEffectInfo004();
    });
    it('EXP_EFFECT_INFO_005', 0, (): Promise<void> => {
      return runEffectInfo005();
    });
    it('EXP_EFFECT_URI_001', 0, (): Promise<void> => {
      return runEffectUri001();
    });
    it('EXP_EFFECT_URI_002', 0, (): Promise<void> => {
      return runEffectUri002();
    });
    it('EXP_EFFECT_URI_003', 0, (): Promise<void> => {
      return runEffectUri003();
    });
    it('EXP_EFFECT_URI_004', 0, (): Promise<void> => {
      return runEffectUri004();
    });
    it('EXP_EFFECT_URI_005', 0, (): Promise<void> => {
      return runEffectUri005();
    });
    it('EXP_EFFECT_URI_006', 0, (): Promise<void> => {
      return runEffectUri006();
    });
    it('EXP_EFFECT_URI_007', 0, (): Promise<void> => {
      return runEffectUri007();
    });
    it('EXP_EFFECT_URI_008', 0, (): Promise<void> => {
      return runEffectUri008();
    });
    it('EXP_EFFECT_URI_009', 0, (): Promise<void> => {
      return runEffectUri009();
    });
    it('EXP_V2_EFFECT_BUILTIN_0001', 0, (): Promise<void> => {
      return runV2EffectBuiltin0001();
    });
    it('EXP_V2_EFFECT_BUILTIN_0002', 0, (): Promise<void> => {
      return runV2EffectBuiltin0002();
    });
    it('EXP_V2_EFFECT_BUILTIN_0003', 0, (): Promise<void> => {
      return runV2EffectBuiltin0003();
    });
    it('EXP_V2_EFFECT_BUILTIN_0004', 0, (): Promise<void> => {
      return runV2EffectBuiltin0004();
    });
    it('EXP_V2_EFFECT_BUILTIN_0005', 0, (): Promise<void> => {
      return runV2EffectBuiltin0005();
    });
    it('EXP_V2_EFFECT_BUILTIN_0006', 0, (): Promise<void> => {
      return runV2EffectBuiltin0006();
    });
    it('EXP_V2_EFFECT_BUILTIN_0007', 0, (): Promise<void> => {
      return runV2EffectBuiltin0007();
    });
    it('EXP_V2_EFFECT_BUILTIN_0008', 0, (): Promise<void> => {
      return runV2EffectBuiltin0008();
    });
    it('EXP_V2_EFFECT_BUILTIN_0009', 0, (): Promise<void> => {
      return runV2EffectBuiltin0009();
    });
    it('EXP_V2_EFFECT_BUILTIN_0010', 0, (): Promise<void> => {
      return runV2EffectBuiltin0010();
    });
    it('EXP_V2_EFFECT_BUILTIN_0011', 0, (): Promise<void> => {
      return runV2EffectBuiltin0011();
    });
    it('EXP_V2_EFFECT_BUILTIN_0012', 0, (): Promise<void> => {
      return runV2EffectBuiltin0012();
    });
    it('EXP_V2_EFFECT_BUILTIN_0013', 0, (): Promise<void> => {
      return runV2EffectBuiltin0013();
    });
    it('EXP_V2_EFFECT_BUILTIN_0014', 0, (): Promise<void> => {
      return runV2EffectBuiltin0014();
    });
    it('EXP_V2_EFFECT_BUILTIN_0015', 0, (): Promise<void> => {
      return runV2EffectBuiltin0015();
    });
    it('EXP_V2_EFFECT_BUILTIN_0016', 0, (): Promise<void> => {
      return runV2EffectBuiltin0016();
    });
    it('EXP_V2_EFFECT_BUILTIN_0017', 0, (): Promise<void> => {
      return runV2EffectBuiltin0017();
    });
    it('EXP_V2_EFFECT_BUILTIN_0018', 0, (): Promise<void> => {
      return runV2EffectBuiltin0018();
    });
    it('EXP_V2_EFFECT_BUILTIN_0019', 0, (): Promise<void> => {
      return runV2EffectBuiltin0019();
    });
    it('EXP_V2_EFFECT_BUILTIN_0020', 0, (): Promise<void> => {
      return runV2EffectBuiltin0020();
    });
    it('EXP_V2_EFFECT_BUILTIN_0021', 0, (): Promise<void> => {
      return runV2EffectBuiltin0021();
    });
    it('EXP_V2_EFFECT_BUILTIN_0022', 0, (): Promise<void> => {
      return runV2EffectBuiltin0022();
    });
    it('EXP_V2_EFFECT_BUILTIN_0023', 0, (): Promise<void> => {
      return runV2EffectBuiltin0023();
    });
    it('EXP_V2_EFFECT_BUILTIN_0024', 0, (): Promise<void> => {
      return runV2EffectBuiltin0024();
    });
    it('EXP_V2_EFFECT_BUILTIN_0025', 0, (): Promise<void> => {
      return runV2EffectBuiltin0025();
    });
    it('EXP_V2_EFFECT_BUILTIN_0026', 0, (): Promise<void> => {
      return runV2EffectBuiltin0026();
    });
    it('EXP_V2_EFFECT_BUILTIN_0027', 0, (): Promise<void> => {
      return runV2EffectBuiltin0027();
    });
    it('EXP_V2_EFFECT_BUILTIN_0028', 0, (): Promise<void> => {
      return runV2EffectBuiltin0028();
    });
    it('EXP_V2_EFFECT_BUILTIN_0029', 0, (): Promise<void> => {
      return runV2EffectBuiltin0029();
    });
    it('EXP_V2_EFFECT_BUILTIN_0030', 0, (): Promise<void> => {
      return runV2EffectBuiltin0030();
    });
    it('EXP_V2_EFFECT_BUILTIN_0031', 0, (): Promise<void> => {
      return runV2EffectBuiltin0031();
    });
    it('EXP_V2_EFFECT_BUILTIN_0032', 0, (): Promise<void> => {
      return runV2EffectBuiltin0032();
    });
    it('EXP_V2_EFFECT_BUILTIN_0033', 0, (): Promise<void> => {
      return runV2EffectBuiltin0033();
    });
    it('EXP_V2_EFFECT_BUILTIN_0034', 0, (): Promise<void> => {
      return runV2EffectBuiltin0034();
    });
    it('EXP_V2_EFFECT_BUILTIN_0035', 0, (): Promise<void> => {
      return runV2EffectBuiltin0035();
    });
    it('EXP_V2_EFFECT_BUILTIN_0036', 0, (): Promise<void> => {
      return runV2EffectBuiltin0036();
    });
    it('EXP_V2_EFFECT_BUILTIN_0037', 0, (): Promise<void> => {
      return runV2EffectBuiltin0037();
    });
    it('EXP_V2_EFFECT_BUILTIN_0038', 0, (): Promise<void> => {
      return runV2EffectBuiltin0038();
    });
    it('EXP_V2_EFFECT_BUILTIN_0039', 0, (): Promise<void> => {
      return runV2EffectBuiltin0039();
    });
    it('EXP_V2_EFFECT_BUILTIN_0040', 0, (): Promise<void> => {
      return runV2EffectBuiltin0040();
    });
    it('EXP_V2_EFFECT_BUILTIN_0041', 0, (): Promise<void> => {
      return runV2EffectBuiltin0041();
    });
    it('EXP_V2_EFFECT_BUILTIN_0042', 0, (): Promise<void> => {
      return runV2EffectBuiltin0042();
    });
    it('EXP_V2_EFFECT_BUILTIN_0043', 0, (): Promise<void> => {
      return runV2EffectBuiltin0043();
    });
    it('EXP_V2_EFFECT_BUILTIN_0044', 0, (): Promise<void> => {
      return runV2EffectBuiltin0044();
    });
    it('EXP_V2_EFFECT_BUILTIN_0045', 0, (): Promise<void> => {
      return runV2EffectBuiltin0045();
    });
    it('EXP_V2_EFFECT_BUILTIN_0046', 0, (): Promise<void> => {
      return runV2EffectBuiltin0046();
    });
    it('EXP_V2_EFFECT_BUILTIN_0047', 0, (): Promise<void> => {
      return runV2EffectBuiltin0047();
    });
    it('EXP_V2_EFFECT_BUILTIN_0048', 0, (): Promise<void> => {
      return runV2EffectBuiltin0048();
    });
    it('EXP_V2_EFFECT_BUILTIN_0049', 0, (): Promise<void> => {
      return runV2EffectBuiltin0049();
    });
    it('EXP_V2_EFFECT_BUILTIN_0050', 0, (): Promise<void> => {
      return runV2EffectBuiltin0050();
    });
    it('EXP_V2_EFFECT_BUILTIN_0051', 0, (): Promise<void> => {
      return runV2EffectBuiltin0051();
    });
    it('EXP_V2_EFFECT_BUILTIN_0052', 0, (): Promise<void> => {
      return runV2EffectBuiltin0052();
    });
    it('EXP_V2_EFFECT_BUILTIN_0053', 0, (): Promise<void> => {
      return runV2EffectBuiltin0053();
    });
    it('EXP_V2_EFFECT_BUILTIN_0054', 0, (): Promise<void> => {
      return runV2EffectBuiltin0054();
    });
    it('EXP_V2_EFFECT_BUILTIN_0055', 0, (): Promise<void> => {
      return runV2EffectBuiltin0055();
    });
    it('EXP_V2_EFFECT_BUILTIN_0056', 0, (): Promise<void> => {
      return runV2EffectBuiltin0056();
    });
    it('EXP_V2_EFFECT_BUILTIN_0057', 0, (): Promise<void> => {
      return runV2EffectBuiltin0057();
    });
    it('EXP_V2_EFFECT_BUILTIN_0058', 0, (): Promise<void> => {
      return runV2EffectBuiltin0058();
    });
    it('EXP_V2_EFFECT_BUILTIN_0059', 0, (): Promise<void> => {
      return runV2EffectBuiltin0059();
    });
    it('EXP_V2_EFFECT_BUILTIN_0060', 0, (): Promise<void> => {
      return runV2EffectBuiltin0060();
    });
    it('EXP_V2_EFFECT_BUILTIN_0061', 0, (): Promise<void> => {
      return runV2EffectBuiltin0061();
    });
    it('EXP_V2_EFFECT_BUILTIN_0062', 0, (): Promise<void> => {
      return runV2EffectBuiltin0062();
    });
    it('EXP_V2_EFFECT_BUILTIN_0063', 0, (): Promise<void> => {
      return runV2EffectBuiltin0063();
    });
    it('EXP_V2_EFFECT_BUILTIN_0064', 0, (): Promise<void> => {
      return runV2EffectBuiltin0064();
    });
    it('EXP_V2_EFFECT_BUILTIN_0065', 0, (): Promise<void> => {
      return runV2EffectBuiltin0065();
    });
    it('EXP_V2_EFFECT_BUILTIN_0066', 0, (): Promise<void> => {
      return runV2EffectBuiltin0066();
    });
    it('EXP_V2_EFFECT_BUILTIN_0067', 0, (): Promise<void> => {
      return runV2EffectBuiltin0067();
    });
    it('EXP_V2_EFFECT_BUILTIN_0068', 0, (): Promise<void> => {
      return runV2EffectBuiltin0068();
    });
    it('EXP_V2_EFFECT_BUILTIN_0069', 0, (): Promise<void> => {
      return runV2EffectBuiltin0069();
    });
    it('EXP_V2_EFFECT_BUILTIN_0070', 0, (): Promise<void> => {
      return runV2EffectBuiltin0070();
    });
    it('EXP_V2_EFFECT_BUILTIN_0071', 0, (): Promise<void> => {
      return runV2EffectBuiltin0071();
    });
    it('EXP_V2_EFFECT_BUILTIN_0072', 0, (): Promise<void> => {
      return runV2EffectBuiltin0072();
    });
    it('EXP_V2_EFFECT_BUILTIN_0073', 0, (): Promise<void> => {
      return runV2EffectBuiltin0073();
    });
    it('EXP_V2_EFFECT_BUILTIN_0074', 0, (): Promise<void> => {
      return runV2EffectBuiltin0074();
    });
    it('EXP_V2_EFFECT_BUILTIN_0075', 0, (): Promise<void> => {
      return runV2EffectBuiltin0075();
    });
    it('EXP_V2_EFFECT_BUILTIN_0076', 0, (): Promise<void> => {
      return runV2EffectBuiltin0076();
    });
    it('EXP_V2_EFFECT_BUILTIN_0077', 0, (): Promise<void> => {
      return runV2EffectBuiltin0077();
    });
    it('EXP_V2_EFFECT_BUILTIN_0078', 0, (): Promise<void> => {
      return runV2EffectBuiltin0078();
    });
    it('EXP_V2_EFFECT_BUILTIN_0079', 0, (): Promise<void> => {
      return runV2EffectBuiltin0079();
    });
    it('EXP_V2_EFFECT_BUILTIN_0080', 0, (): Promise<void> => {
      return runV2EffectBuiltin0080();
    });
    it('EXP_V2_EFFECT_BUILTIN_0081', 0, (): Promise<void> => {
      return runV2EffectBuiltin0081();
    });
    it('EXP_V2_EFFECT_BUILTIN_0082', 0, (): Promise<void> => {
      return runV2EffectBuiltin0082();
    });
    it('EXP_V2_EFFECT_BUILTIN_0083', 0, (): Promise<void> => {
      return runV2EffectBuiltin0083();
    });
    it('EXP_V2_EFFECT_BUILTIN_0084', 0, (): Promise<void> => {
      return runV2EffectBuiltin0084();
    });
    it('EXP_V2_EFFECT_BUILTIN_0085', 0, (): Promise<void> => {
      return runV2EffectBuiltin0085();
    });
    it('EXP_V2_EFFECT_BUILTIN_0086', 0, (): Promise<void> => {
      return runV2EffectBuiltin0086();
    });
    it('EXP_V2_EFFECT_BUILTIN_0087', 0, (): Promise<void> => {
      return runV2EffectBuiltin0087();
    });
    it('EXP_V2_EFFECT_BUILTIN_0088', 0, (): Promise<void> => {
      return runV2EffectBuiltin0088();
    });
    it('EXP_V2_EFFECT_BUILTIN_0089', 0, (): Promise<void> => {
      return runV2EffectBuiltin0089();
    });
    it('EXP_V2_EFFECT_BUILTIN_0090', 0, (): Promise<void> => {
      return runV2EffectBuiltin0090();
    });
    it('EXP_V2_EFFECT_BUILTIN_0091', 0, (): Promise<void> => {
      return runV2EffectBuiltin0091();
    });
    it('EXP_V2_EFFECT_BUILTIN_0092', 0, (): Promise<void> => {
      return runV2EffectBuiltin0092();
    });
    it('EXP_V2_EFFECT_BUILTIN_0093', 0, (): Promise<void> => {
      return runV2EffectBuiltin0093();
    });
    it('EXP_V2_EFFECT_BUILTIN_0094', 0, (): Promise<void> => {
      return runV2EffectBuiltin0094();
    });
    it('EXP_V2_EFFECT_BUILTIN_0095', 0, (): Promise<void> => {
      return runV2EffectBuiltin0095();
    });
    it('EXP_V2_EFFECT_BUILTIN_0096', 0, (): Promise<void> => {
      return runV2EffectBuiltin0096();
    });
    it('EXP_V2_EFFECT_BUILTIN_0097', 0, (): Promise<void> => {
      return runV2EffectBuiltin0097();
    });
    it('EXP_V2_EFFECT_BUILTIN_0098', 0, (): Promise<void> => {
      return runV2EffectBuiltin0098();
    });
    it('EXP_V2_EFFECT_BUILTIN_0099', 0, (): Promise<void> => {
      return runV2EffectBuiltin0099();
    });
    it('EXP_V2_EFFECT_BUILTIN_0100', 0, (): Promise<void> => {
      return runV2EffectBuiltin0100();
    });
    it('EXP_V2_EFFECT_BUILTIN_0101', 0, (): Promise<void> => {
      return runV2EffectBuiltin0101();
    });
    it('EXP_V2_EFFECT_BUILTIN_0102', 0, (): Promise<void> => {
      return runV2EffectBuiltin0102();
    });
    it('EXP_V2_EFFECT_BUILTIN_0103', 0, (): Promise<void> => {
      return runV2EffectBuiltin0103();
    });
    it('EXP_V2_EFFECT_BUILTIN_0104', 0, (): Promise<void> => {
      return runV2EffectBuiltin0104();
    });
    it('EXP_V2_EFFECT_BUILTIN_0105', 0, (): Promise<void> => {
      return runV2EffectBuiltin0105();
    });
    it('EXP_V2_EFFECT_BUILTIN_0106', 0, (): Promise<void> => {
      return runV2EffectBuiltin0106();
    });
    it('EXP_V2_EFFECT_BUILTIN_0107', 0, (): Promise<void> => {
      return runV2EffectBuiltin0107();
    });
    it('EXP_V2_EFFECT_BUILTIN_0108', 0, (): Promise<void> => {
      return runV2EffectBuiltin0108();
    });
    it('EXP_V2_EFFECT_CHAIN_0001', 0, (): Promise<void> => {
      return runV2EffectChain0001();
    });
    it('EXP_V2_EFFECT_CHAIN_0002', 0, (): Promise<void> => {
      return runV2EffectChain0002();
    });
    it('EXP_V2_EFFECT_CHAIN_0003', 0, (): Promise<void> => {
      return runV2EffectChain0003();
    });
    it('EXP_V2_EFFECT_CHAIN_0004', 0, (): Promise<void> => {
      return runV2EffectChain0004();
    });
    it('EXP_V2_EFFECT_CHAIN_0005', 0, (): Promise<void> => {
      return runV2EffectChain0005();
    });
    it('EXP_V2_EFFECT_CHAIN_0006', 0, (): Promise<void> => {
      return runV2EffectChain0006();
    });
    it('EXP_V2_EFFECT_CHAIN_0007', 0, (): Promise<void> => {
      return runV2EffectChain0007();
    });
    it('EXP_V2_EFFECT_CHAIN_0008', 0, (): Promise<void> => {
      return runV2EffectChain0008();
    });
    it('EXP_V2_EFFECT_CHAIN_0009', 0, (): Promise<void> => {
      return runV2EffectChain0009();
    });
    it('EXP_V2_EFFECT_CHAIN_0010', 0, (): Promise<void> => {
      return runV2EffectChain0010();
    });
    it('EXP_V2_EFFECT_CHAIN_0011', 0, (): Promise<void> => {
      return runV2EffectChain0011();
    });
    it('EXP_V2_EFFECT_CHAIN_0012', 0, (): Promise<void> => {
      return runV2EffectChain0012();
    });
    it('EXP_V2_EFFECT_CHAIN_0013', 0, (): Promise<void> => {
      return runV2EffectChain0013();
    });
    it('EXP_V2_EFFECT_CHAIN_0014', 0, (): Promise<void> => {
      return runV2EffectChain0014();
    });
    it('EXP_V2_EFFECT_CHAIN_0015', 0, (): Promise<void> => {
      return runV2EffectChain0015();
    });
    it('EXP_V2_EFFECT_CHAIN_0016', 0, (): Promise<void> => {
      return runV2EffectChain0016();
    });
    it('EXP_V2_EFFECT_CHAIN_0017', 0, (): Promise<void> => {
      return runV2EffectChain0017();
    });
    it('EXP_V2_EFFECT_CHAIN_0018', 0, (): Promise<void> => {
      return runV2EffectChain0018();
    });
    it('EXP_V2_EFFECT_CHAIN_0019', 0, (): Promise<void> => {
      return runV2EffectChain0019();
    });
    it('EXP_V2_EFFECT_CHAIN_0020', 0, (): Promise<void> => {
      return runV2EffectChain0020();
    });
    it('EXP_V2_EFFECT_CHAIN_0021', 0, (): Promise<void> => {
      return runV2EffectChain0021();
    });
    it('EXP_V2_EFFECT_CHAIN_0022', 0, (): Promise<void> => {
      return runV2EffectChain0022();
    });
    it('EXP_V2_EFFECT_CHAIN_0023', 0, (): Promise<void> => {
      return runV2EffectChain0023();
    });
    it('EXP_V2_EFFECT_CHAIN_0024', 0, (): Promise<void> => {
      return runV2EffectChain0024();
    });
    it('EXP_V2_EFFECT_CHAIN_0025', 0, (): Promise<void> => {
      return runV2EffectChain0025();
    });
    it('EXP_V2_EFFECT_CHAIN_0026', 0, (): Promise<void> => {
      return runV2EffectChain0026();
    });
    it('EXP_V2_EFFECT_CHAIN_0027', 0, (): Promise<void> => {
      return runV2EffectChain0027();
    });
    it('EXP_V2_EFFECT_CHAIN_0028', 0, (): Promise<void> => {
      return runV2EffectChain0028();
    });
    it('EXP_V2_EFFECT_CHAIN_0029', 0, (): Promise<void> => {
      return runV2EffectChain0029();
    });
    it('EXP_V2_EFFECT_CHAIN_0030', 0, (): Promise<void> => {
      return runV2EffectChain0030();
    });
    it('EXP_V2_EFFECT_CHAIN_0031', 0, (): Promise<void> => {
      return runV2EffectChain0031();
    });
    it('EXP_V2_EFFECT_CHAIN_0032', 0, (): Promise<void> => {
      return runV2EffectChain0032();
    });
    it('EXP_V2_EFFECT_CHAIN_0033', 0, (): Promise<void> => {
      return runV2EffectChain0033();
    });
    it('EXP_V2_EFFECT_CROP_0001', 0, (): Promise<void> => {
      return runV2EffectCrop0001();
    });
    it('EXP_V2_EFFECT_CROP_0002', 0, (): Promise<void> => {
      return runV2EffectCrop0002();
    });
    it('EXP_V2_EFFECT_CROP_0003', 0, (): Promise<void> => {
      return runV2EffectCrop0003();
    });
    it('EXP_V2_EFFECT_CROP_0004', 0, (): Promise<void> => {
      return runV2EffectCrop0004();
    });
    it('EXP_V2_EFFECT_CROP_0005', 0, (): Promise<void> => {
      return runV2EffectCrop0005();
    });
    it('EXP_V2_EFFECT_CROP_0006', 0, (): Promise<void> => {
      return runV2EffectCrop0006();
    });
    it('EXP_V2_EFFECT_CROP_0007', 0, (): Promise<void> => {
      return runV2EffectCrop0007();
    });
    it('EXP_V2_EFFECT_CROP_0008', 0, (): Promise<void> => {
      return runV2EffectCrop0008();
    });
    it('EXP_V2_EFFECT_CROP_0009', 0, (): Promise<void> => {
      return runV2EffectCrop0009();
    });
    it('EXP_V2_EFFECT_CROP_0010', 0, (): Promise<void> => {
      return runV2EffectCrop0010();
    });
    it('EXP_V2_EFFECT_CROP_0011', 0, (): Promise<void> => {
      return runV2EffectCrop0011();
    });
    it('EXP_V2_EFFECT_CROP_0012', 0, (): Promise<void> => {
      return runV2EffectCrop0012();
    });
    it('EXP_V2_EFFECT_CROP_0013', 0, (): Promise<void> => {
      return runV2EffectCrop0013();
    });
    it('EXP_V2_EFFECT_CROP_0014', 0, (): Promise<void> => {
      return runV2EffectCrop0014();
    });
    it('EXP_V2_EFFECT_CROP_0015', 0, (): Promise<void> => {
      return runV2EffectCrop0015();
    });
    it('EXP_V2_EFFECT_CROP_0016', 0, (): Promise<void> => {
      return runV2EffectCrop0016();
    });
    it('EXP_V2_EFFECT_CROP_0017', 0, (): Promise<void> => {
      return runV2EffectCrop0017();
    });
    it('EXP_V2_EFFECT_CROP_0018', 0, (): Promise<void> => {
      return runV2EffectCrop0018();
    });
    it('EXP_V2_EFFECT_CROP_0019', 0, (): Promise<void> => {
      return runV2EffectCrop0019();
    });
    it('EXP_V2_EFFECT_CROP_0020', 0, (): Promise<void> => {
      return runV2EffectCrop0020();
    });
    it('EXP_V2_EFFECT_CROP_0021', 0, (): Promise<void> => {
      return runV2EffectCrop0021();
    });
    it('EXP_V2_EFFECT_CROP_0022', 0, (): Promise<void> => {
      return runV2EffectCrop0022();
    });
    it('EXP_V2_EFFECT_CROP_0023', 0, (): Promise<void> => {
      return runV2EffectCrop0023();
    });
    it('EXP_V2_EFFECT_CROP_0024', 0, (): Promise<void> => {
      return runV2EffectCrop0024();
    });
    it('EXP_V2_EFFECT_CROP_0025', 0, (): Promise<void> => {
      return runV2EffectCrop0025();
    });
    it('EXP_V2_EFFECT_CROP_0026', 0, (): Promise<void> => {
      return runV2EffectCrop0026();
    });
    it('EXP_V2_EFFECT_CROP_0027', 0, (): Promise<void> => {
      return runV2EffectCrop0027();
    });
    it('EXP_V2_EFFECT_CROP_0028', 0, (): Promise<void> => {
      return runV2EffectCrop0028();
    });
    it('EXP_V2_EFFECT_CROP_0029', 0, (): Promise<void> => {
      return runV2EffectCrop0029();
    });
    it('EXP_V2_EFFECT_CROP_0030', 0, (): Promise<void> => {
      return runV2EffectCrop0030();
    });
    it('EXP_V2_EFFECT_CROP_0031', 0, (): Promise<void> => {
      return runV2EffectCrop0031();
    });
    it('EXP_V2_EFFECT_CROP_0032', 0, (): Promise<void> => {
      return runV2EffectCrop0032();
    });
    it('EXP_V2_EFFECT_CROP_0033', 0, (): Promise<void> => {
      return runV2EffectCrop0033();
    });
    it('EXP_V2_EFFECT_CROP_0034', 0, (): Promise<void> => {
      return runV2EffectCrop0034();
    });
    it('EXP_V2_EFFECT_CROP_0035', 0, (): Promise<void> => {
      return runV2EffectCrop0035();
    });
    it('EXP_V2_EFFECT_CROP_0036', 0, (): Promise<void> => {
      return runV2EffectCrop0036();
    });
    it('EXP_V2_EFFECT_CROP_0037', 0, (): Promise<void> => {
      return runV2EffectCrop0037();
    });
    it('EXP_V2_EFFECT_CROP_0038', 0, (): Promise<void> => {
      return runV2EffectCrop0038();
    });
    it('EXP_V2_EFFECT_CROP_0039', 0, (): Promise<void> => {
      return runV2EffectCrop0039();
    });
    it('EXP_V2_EFFECT_CROP_0040', 0, (): Promise<void> => {
      return runV2EffectCrop0040();
    });
    it('EXP_V2_EFFECT_CROP_0041', 0, (): Promise<void> => {
      return runV2EffectCrop0041();
    });
    it('EXP_V2_EFFECT_CROP_0042', 0, (): Promise<void> => {
      return runV2EffectCrop0042();
    });
    it('EXP_V2_EFFECT_CROP_0043', 0, (): Promise<void> => {
      return runV2EffectCrop0043();
    });
    it('EXP_V2_EFFECT_CROP_0044', 0, (): Promise<void> => {
      return runV2EffectCrop0044();
    });
    it('EXP_V2_EFFECT_CROP_0045', 0, (): Promise<void> => {
      return runV2EffectCrop0045();
    });
    it('EXP_V2_EFFECT_CROP_0046', 0, (): Promise<void> => {
      return runV2EffectCrop0046();
    });
    it('EXP_V2_EFFECT_CROP_0047', 0, (): Promise<void> => {
      return runV2EffectCrop0047();
    });
    it('EXP_V2_EFFECT_CROP_0048', 0, (): Promise<void> => {
      return runV2EffectCrop0048();
    });
    it('EXP_V2_EFFECT_CROP_0049', 0, (): Promise<void> => {
      return runV2EffectCrop0049();
    });
    it('EXP_V2_EFFECT_CROP_0050', 0, (): Promise<void> => {
      return runV2EffectCrop0050();
    });
    it('EXP_V2_EFFECT_CROP_0051', 0, (): Promise<void> => {
      return runV2EffectCrop0051();
    });
    it('EXP_V2_EFFECT_CROP_0052', 0, (): Promise<void> => {
      return runV2EffectCrop0052();
    });
    it('EXP_V2_EFFECT_CROP_0053', 0, (): Promise<void> => {
      return runV2EffectCrop0053();
    });
    it('EXP_V2_EFFECT_CROP_0054', 0, (): Promise<void> => {
      return runV2EffectCrop0054();
    });
    it('EXP_V2_EFFECT_CROP_0055', 0, (): Promise<void> => {
      return runV2EffectCrop0055();
    });
    it('EXP_V2_EFFECT_CROP_0056', 0, (): Promise<void> => {
      return runV2EffectCrop0056();
    });
    it('EXP_V2_EFFECT_CROP_0057', 0, (): Promise<void> => {
      return runV2EffectCrop0057();
    });
    it('EXP_V2_EFFECT_CROP_0058', 0, (): Promise<void> => {
      return runV2EffectCrop0058();
    });
    it('EXP_V2_EFFECT_CROP_0059', 0, (): Promise<void> => {
      return runV2EffectCrop0059();
    });
    it('EXP_V2_EFFECT_CROP_0060', 0, (): Promise<void> => {
      return runV2EffectCrop0060();
    });
    it('EXP_V2_EFFECT_CROP_0061', 0, (): Promise<void> => {
      return runV2EffectCrop0061();
    });
    it('EXP_V2_EFFECT_CROP_0062', 0, (): Promise<void> => {
      return runV2EffectCrop0062();
    });
    it('EXP_V2_EFFECT_CROP_0063', 0, (): Promise<void> => {
      return runV2EffectCrop0063();
    });
    it('EXP_V2_EFFECT_CROP_0064', 0, (): Promise<void> => {
      return runV2EffectCrop0064();
    });
    it('EXP_V2_EFFECT_DECODE_0001', 0, (): Promise<void> => {
      return runV2EffectDecode0001();
    });
    it('EXP_V2_EFFECT_DECODE_0002', 0, (): Promise<void> => {
      return runV2EffectDecode0002();
    });
    it('EXP_V2_EFFECT_DECODE_0003', 0, (): Promise<void> => {
      return runV2EffectDecode0003();
    });
    it('EXP_V2_EFFECT_DECODE_0004', 0, (): Promise<void> => {
      return runV2EffectDecode0004();
    });
    it('EXP_V2_EFFECT_DECODE_0005', 0, (): Promise<void> => {
      return runV2EffectDecode0005();
    });
    it('EXP_V2_EFFECT_DECODE_0006', 0, (): Promise<void> => {
      return runV2EffectDecode0006();
    });
    it('EXP_V2_EFFECT_DECODE_0007', 0, (): Promise<void> => {
      return runV2EffectDecode0007();
    });
    it('EXP_V2_EFFECT_DECODE_0008', 0, (): Promise<void> => {
      return runV2EffectDecode0008();
    });
    it('EXP_V2_EFFECT_DECODE_0009', 0, (): Promise<void> => {
      return runV2EffectDecode0009();
    });
    it('EXP_V2_EFFECT_DECODE_0010', 0, (): Promise<void> => {
      return runV2EffectDecode0010();
    });
    it('EXP_V2_EFFECT_DECODE_0011', 0, (): Promise<void> => {
      return runV2EffectDecode0011();
    });
    it('EXP_V2_EFFECT_DECODE_0012', 0, (): Promise<void> => {
      return runV2EffectDecode0012();
    });
    it('EXP_V2_EFFECT_DECODE_0013', 0, (): Promise<void> => {
      return runV2EffectDecode0013();
    });
    it('EXP_V2_EFFECT_DECODE_0014', 0, (): Promise<void> => {
      return runV2EffectDecode0014();
    });
    it('EXP_V2_EFFECT_DECODE_0015', 0, (): Promise<void> => {
      return runV2EffectDecode0015();
    });
    it('EXP_V2_EFFECT_DECODE_0016', 0, (): Promise<void> => {
      return runV2EffectDecode0016();
    });
    it('EXP_V2_EFFECT_DECODE_0017', 0, (): Promise<void> => {
      return runV2EffectDecode0017();
    });
    it('EXP_V2_EFFECT_DECODE_0018', 0, (): Promise<void> => {
      return runV2EffectDecode0018();
    });
    it('EXP_V2_EFFECT_DECODE_0019', 0, (): Promise<void> => {
      return runV2EffectDecode0019();
    });
    it('EXP_V2_EFFECT_DECODE_0020', 0, (): Promise<void> => {
      return runV2EffectDecode0020();
    });
    it('EXP_V2_EFFECT_SOLID_0001', 0, (): Promise<void> => {
      return runV2EffectSolid0001();
    });
    it('EXP_V2_EFFECT_SOLID_0002', 0, (): Promise<void> => {
      return runV2EffectSolid0002();
    });
    it('EXP_V2_EFFECT_SOLID_0003', 0, (): Promise<void> => {
      return runV2EffectSolid0003();
    });
    it('EXP_V2_EFFECT_SOLID_0004', 0, (): Promise<void> => {
      return runV2EffectSolid0004();
    });
    it('EXP_V2_EFFECT_SOLID_0005', 0, (): Promise<void> => {
      return runV2EffectSolid0005();
    });
    it('EXP_V2_EFFECT_SOLID_0006', 0, (): Promise<void> => {
      return runV2EffectSolid0006();
    });
    it('EXP_V2_EFFECT_SOLID_0007', 0, (): Promise<void> => {
      return runV2EffectSolid0007();
    });
    it('EXP_V2_EFFECT_SOLID_0008', 0, (): Promise<void> => {
      return runV2EffectSolid0008();
    });
    it('EXP_V2_EFFECT_SOLID_0009', 0, (): Promise<void> => {
      return runV2EffectSolid0009();
    });
    it('EXP_V2_EFFECT_SOLID_0010', 0, (): Promise<void> => {
      return runV2EffectSolid0010();
    });
    it('EXP_V2_EFFECT_SOLID_0011', 0, (): Promise<void> => {
      return runV2EffectSolid0011();
    });
    it('EXP_V2_EFFECT_SOLID_0012', 0, (): Promise<void> => {
      return runV2EffectSolid0012();
    });
    it('EXP_V2_EFFECT_SOLID_0013', 0, (): Promise<void> => {
      return runV2EffectSolid0013();
    });
    it('EXP_V2_EFFECT_SOLID_0014', 0, (): Promise<void> => {
      return runV2EffectSolid0014();
    });
    it('EXP_V2_EFFECT_SOLID_0015', 0, (): Promise<void> => {
      return runV2EffectSolid0015();
    });
    it('EXP_V2_EFFECT_SOLID_0016', 0, (): Promise<void> => {
      return runV2EffectSolid0016();
    });
    it('EXP_V2_EFFECT_SOLID_0017', 0, (): Promise<void> => {
      return runV2EffectSolid0017();
    });
    it('EXP_V2_EFFECT_SOLID_0018', 0, (): Promise<void> => {
      return runV2EffectSolid0018();
    });
    it('EXP_V2_EFFECT_SOLID_0019', 0, (): Promise<void> => {
      return runV2EffectSolid0019();
    });
    it('EXP_V2_EFFECT_SOLID_0020', 0, (): Promise<void> => {
      return runV2EffectSolid0020();
    });
    it('EXP_V2_EFFECT_SOLID_0021', 0, (): Promise<void> => {
      return runV2EffectSolid0021();
    });
    it('EXP_V2_EFFECT_SOLID_0022', 0, (): Promise<void> => {
      return runV2EffectSolid0022();
    });
    it('EXP_V2_EFFECT_SOLID_0023', 0, (): Promise<void> => {
      return runV2EffectSolid0023();
    });
    it('EXP_V2_EFFECT_SOLID_0024', 0, (): Promise<void> => {
      return runV2EffectSolid0024();
    });
    it('EXP_V2_EFFECT_SOLID_0025', 0, (): Promise<void> => {
      return runV2EffectSolid0025();
    });
    it('EXP_V2_EFFECT_SOLID_0026', 0, (): Promise<void> => {
      return runV2EffectSolid0026();
    });
    it('EXP_V2_EFFECT_SOLID_0027', 0, (): Promise<void> => {
      return runV2EffectSolid0027();
    });
    it('EXP_V2_EFFECT_SOLID_0028', 0, (): Promise<void> => {
      return runV2EffectSolid0028();
    });
    it('EXP_V2_EFFECT_SOLID_0029', 0, (): Promise<void> => {
      return runV2EffectSolid0029();
    });
    it('EXP_V2_EFFECT_SOLID_0030', 0, (): Promise<void> => {
      return runV2EffectSolid0030();
    });
    it('EXP_V2_EFFECT_SOLID_0031', 0, (): Promise<void> => {
      return runV2EffectSolid0031();
    });
    it('EXP_V2_EFFECT_SOLID_0032', 0, (): Promise<void> => {
      return runV2EffectSolid0032();
    });
    it('EXP_V2_EFFECT_SOLID_0033', 0, (): Promise<void> => {
      return runV2EffectSolid0033();
    });
    it('EXP_V2_EFFECT_SOLID_0034', 0, (): Promise<void> => {
      return runV2EffectSolid0034();
    });
    it('EXP_V2_EFFECT_SOLID_0035', 0, (): Promise<void> => {
      return runV2EffectSolid0035();
    });
    it('EXP_V2_EFFECT_SOLID_0036', 0, (): Promise<void> => {
      return runV2EffectSolid0036();
    });
    it('EXP_V2_EFFECT_SOLID_0037', 0, (): Promise<void> => {
      return runV2EffectSolid0037();
    });
    it('EXP_V2_EFFECT_SOLID_0038', 0, (): Promise<void> => {
      return runV2EffectSolid0038();
    });
    it('EXP_V2_EFFECT_SOLID_0039', 0, (): Promise<void> => {
      return runV2EffectSolid0039();
    });
    it('EXP_V2_EFFECT_SOLID_0040', 0, (): Promise<void> => {
      return runV2EffectSolid0040();
    });
    it('EXP_V2_EFFECT_SOLID_0041', 0, (): Promise<void> => {
      return runV2EffectSolid0041();
    });
    it('EXP_V2_EFFECT_SOLID_0042', 0, (): Promise<void> => {
      return runV2EffectSolid0042();
    });
    it('EXP_V2_EFFECT_SOLID_0043', 0, (): Promise<void> => {
      return runV2EffectSolid0043();
    });
    it('EXP_V2_EFFECT_SOLID_0044', 0, (): Promise<void> => {
      return runV2EffectSolid0044();
    });
    it('EXP_V2_EFFECT_SOLID_0045', 0, (): Promise<void> => {
      return runV2EffectSolid0045();
    });
    it('EXP_V2_EFFECT_SOLID_0046', 0, (): Promise<void> => {
      return runV2EffectSolid0046();
    });
    it('EXP_V2_EFFECT_SOLID_0047', 0, (): Promise<void> => {
      return runV2EffectSolid0047();
    });
    it('EXP_V2_EFFECT_SOLID_0048', 0, (): Promise<void> => {
      return runV2EffectSolid0048();
    });
    it('EXP_V2_EFFECT_SOLID_0049', 0, (): Promise<void> => {
      return runV2EffectSolid0049();
    });
    it('EXP_V2_EFFECT_SOLID_0050', 0, (): Promise<void> => {
      return runV2EffectSolid0050();
    });
    it('EXP_V2_EFFECT_SOLID_0051', 0, (): Promise<void> => {
      return runV2EffectSolid0051();
    });
    it('EXP_V2_EFFECT_SOLID_0052', 0, (): Promise<void> => {
      return runV2EffectSolid0052();
    });
    it('EXP_V2_EFFECT_SOLID_0053', 0, (): Promise<void> => {
      return runV2EffectSolid0053();
    });
    it('EXP_V2_EFFECT_SOLID_0054', 0, (): Promise<void> => {
      return runV2EffectSolid0054();
    });
    it('EXP_V2_EFFECT_SOLID_0055', 0, (): Promise<void> => {
      return runV2EffectSolid0055();
    });
    it('EXP_V2_EFFECT_SOLID_0056', 0, (): Promise<void> => {
      return runV2EffectSolid0056();
    });
    it('EXP_V2_EFFECT_SOLID_0057', 0, (): Promise<void> => {
      return runV2EffectSolid0057();
    });
    it('EXP_V2_EFFECT_SOLID_0058', 0, (): Promise<void> => {
      return runV2EffectSolid0058();
    });
    it('EXP_V2_EFFECT_SOLID_0059', 0, (): Promise<void> => {
      return runV2EffectSolid0059();
    });
    it('EXP_V2_EFFECT_SOLID_0060', 0, (): Promise<void> => {
      return runV2EffectSolid0060();
    });
    it('EXP_V2_EFFECT_SOLID_0061', 0, (): Promise<void> => {
      return runV2EffectSolid0061();
    });
    it('EXP_V2_EFFECT_SOLID_0062', 0, (): Promise<void> => {
      return runV2EffectSolid0062();
    });
    it('EXP_V2_EFFECT_SOLID_0063', 0, (): Promise<void> => {
      return runV2EffectSolid0063();
    });
    it('EXP_V2_EFFECT_SOLID_0064', 0, (): Promise<void> => {
      return runV2EffectSolid0064();
    });
    it('EXP_V2_EFFECT_SOLID_0065', 0, (): Promise<void> => {
      return runV2EffectSolid0065();
    });
    it('EXP_V2_EFFECT_SOLID_0066', 0, (): Promise<void> => {
      return runV2EffectSolid0066();
    });
    it('EXP_V2_EFFECT_SOLID_0067', 0, (): Promise<void> => {
      return runV2EffectSolid0067();
    });
    it('EXP_V2_EFFECT_SOLID_0068', 0, (): Promise<void> => {
      return runV2EffectSolid0068();
    });
    it('EXP_V2_EFFECT_SOLID_0069', 0, (): Promise<void> => {
      return runV2EffectSolid0069();
    });
    it('EXP_V2_EFFECT_SOLID_0070', 0, (): Promise<void> => {
      return runV2EffectSolid0070();
    });
    it('EXP_V2_EFFECT_SOLID_0071', 0, (): Promise<void> => {
      return runV2EffectSolid0071();
    });
    it('EXP_V2_EFFECT_SOLID_0072', 0, (): Promise<void> => {
      return runV2EffectSolid0072();
    });
    it('EXP_V2_EFFECT_SOLID_0073', 0, (): Promise<void> => {
      return runV2EffectSolid0073();
    });
    it('EXP_V2_EFFECT_SOLID_0074', 0, (): Promise<void> => {
      return runV2EffectSolid0074();
    });
    it('EXP_V2_EFFECT_SOLID_0075', 0, (): Promise<void> => {
      return runV2EffectSolid0075();
    });
    it('EXP_V2_EFFECT_SOLID_0076', 0, (): Promise<void> => {
      return runV2EffectSolid0076();
    });
    it('EXP_V2_EFFECT_SOLID_0077', 0, (): Promise<void> => {
      return runV2EffectSolid0077();
    });
    it('EXP_V2_EFFECT_SOLID_0078', 0, (): Promise<void> => {
      return runV2EffectSolid0078();
    });
    it('EXP_V2_EFFECT_SOLID_0079', 0, (): Promise<void> => {
      return runV2EffectSolid0079();
    });
    it('EXP_V2_EFFECT_SOLID_0080', 0, (): Promise<void> => {
      return runV2EffectSolid0080();
    });
    it('EXP_V2_EFFECT_SOLID_0081', 0, (): Promise<void> => {
      return runV2EffectSolid0081();
    });
    it('EXP_V2_EFFECT_SOLID_0082', 0, (): Promise<void> => {
      return runV2EffectSolid0082();
    });
    it('EXP_V2_EFFECT_SOLID_0083', 0, (): Promise<void> => {
      return runV2EffectSolid0083();
    });
    it('EXP_V2_EFFECT_SOLID_0084', 0, (): Promise<void> => {
      return runV2EffectSolid0084();
    });
    it('EXP_V2_EFFECT_SOLID_0085', 0, (): Promise<void> => {
      return runV2EffectSolid0085();
    });
    it('EXP_V2_EFFECT_SOLID_0086', 0, (): Promise<void> => {
      return runV2EffectSolid0086();
    });
    it('EXP_V2_EFFECT_SOLID_0087', 0, (): Promise<void> => {
      return runV2EffectSolid0087();
    });
    it('EXP_V2_EFFECT_SOLID_0088', 0, (): Promise<void> => {
      return runV2EffectSolid0088();
    });
    it('EXP_V2_EFFECT_SOLID_0089', 0, (): Promise<void> => {
      return runV2EffectSolid0089();
    });
    it('EXP_V2_EFFECT_SOLID_0090', 0, (): Promise<void> => {
      return runV2EffectSolid0090();
    });
    it('EXP_V2_EFFECT_SOLID_0091', 0, (): Promise<void> => {
      return runV2EffectSolid0091();
    });
    it('EXP_V2_EFFECT_SOLID_0092', 0, (): Promise<void> => {
      return runV2EffectSolid0092();
    });
    it('EXP_V2_EFFECT_SOLID_0093', 0, (): Promise<void> => {
      return runV2EffectSolid0093();
    });
    it('EXP_V2_EFFECT_SOLID_0094', 0, (): Promise<void> => {
      return runV2EffectSolid0094();
    });
    it('EXP_V2_EFFECT_SOLID_0095', 0, (): Promise<void> => {
      return runV2EffectSolid0095();
    });
    it('EXP_V2_EFFECT_SOLID_0096', 0, (): Promise<void> => {
      return runV2EffectSolid0096();
    });
  });
}
