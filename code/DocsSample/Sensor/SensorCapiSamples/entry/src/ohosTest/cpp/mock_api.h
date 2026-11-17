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
#pragma once
#include "sensors/oh_sensor.h"
int32_t Mock_OH_SensorEvent_GetTimestamp(Sensor_Event *sensorEvent, int64_t *timestamp);
int32_t Mock_OH_SensorEvent_GetType(Sensor_Event *sensorEvent, Sensor_Type *sensorType);
int32_t Mock_OH_SensorEvent_GetAccuracy(Sensor_Event *sensorEvent, Sensor_Accuracy *accuracy);
int32_t Mock_OH_SensorEvent_GetData(Sensor_Event *sensorEvent, float **data, uint32_t *length);
int32_t Mock_OH_SensorInfo_GetName(Sensor_Info *sensor, char *sensorName, uint32_t *length);
int32_t Mock_OH_SensorInfo_GetVendorName(Sensor_Info *sensor, char *vendorName, uint32_t *length);
int32_t Mock_OH_SensorInfo_GetType(Sensor_Info *sensor, Sensor_Type *sensorType);
int32_t Mock_OH_SensorInfo_GetResolution(Sensor_Info *sensor, float *resolution);
int32_t Mock_OH_SensorInfo_GetMinSamplingInterval(Sensor_Info *sensor, int64_t *minSamplingInterval);
int32_t Mock_OH_SensorInfo_GetMaxSamplingInterval(Sensor_Info *sensor, int64_t *maxSamplingInterval);
Sensor_Result Mock_OH_Sensor_GetInfos(Sensor_Info **infos, uint32_t *count);
Sensor_Info **Mock_OH_Sensor_CreateInfos(uint32_t count);
int32_t Mock_OH_Sensor_DestroyInfos(Sensor_Info **sensors, uint32_t count);
int32_t Mock_OH_Sensor_DestroySubscriptionAttribute(Sensor_SubscriptionAttribute *attribute);
int32_t Mock_OH_Sensor_DestroySubscriptionId(Sensor_SubscriptionId *id);
int32_t Mock_OH_Sensor_DestroySubscriber(Sensor_Subscriber *subscriber);
Sensor_SubscriptionId *Mock_OH_Sensor_CreateSubscriptionId(void);
int32_t Mock_OH_SensorSubscriptionId_SetType(Sensor_SubscriptionId *id, const Sensor_Type sensorType);
Sensor_SubscriptionAttribute *Mock_OH_Sensor_CreateSubscriptionAttribute(void);
int32_t Mock_OH_SensorSubscriptionAttribute_SetSamplingInterval(Sensor_SubscriptionAttribute *attribute,
                                                                const int64_t samplingInterval);
Sensor_Subscriber *Mock_OH_Sensor_CreateSubscriber(void);
int32_t Mock_OH_SensorSubscriber_SetCallback(Sensor_Subscriber *subscriber, const Sensor_EventCallback callback);
Sensor_Result Mock_OH_Sensor_Subscribe(const Sensor_SubscriptionId *id, const Sensor_SubscriptionAttribute *attribute,
                                       const Sensor_Subscriber *subscriber);
Sensor_Result Mock_OH_Sensor_Unsubscribe(const Sensor_SubscriptionId *id, const Sensor_Subscriber *subscriber);

// Match the SDK API names within the isolated sample namespace.
namespace SensorSampleUnderTest
{
inline constexpr auto OH_SensorEvent_GetTimestamp = Mock_OH_SensorEvent_GetTimestamp;
inline constexpr auto OH_SensorEvent_GetType = Mock_OH_SensorEvent_GetType;
inline constexpr auto OH_SensorEvent_GetAccuracy = Mock_OH_SensorEvent_GetAccuracy;
inline constexpr auto OH_SensorEvent_GetData = Mock_OH_SensorEvent_GetData;
inline constexpr auto OH_SensorInfo_GetName = Mock_OH_SensorInfo_GetName;
inline constexpr auto OH_SensorInfo_GetVendorName = Mock_OH_SensorInfo_GetVendorName;
inline constexpr auto OH_SensorInfo_GetType = Mock_OH_SensorInfo_GetType;
inline constexpr auto OH_SensorInfo_GetResolution = Mock_OH_SensorInfo_GetResolution;
inline constexpr auto OH_SensorInfo_GetMinSamplingInterval = Mock_OH_SensorInfo_GetMinSamplingInterval;
inline constexpr auto OH_SensorInfo_GetMaxSamplingInterval = Mock_OH_SensorInfo_GetMaxSamplingInterval;
inline constexpr auto OH_Sensor_GetInfos = Mock_OH_Sensor_GetInfos;
inline constexpr auto OH_Sensor_CreateInfos = Mock_OH_Sensor_CreateInfos;
inline constexpr auto OH_Sensor_DestroyInfos = Mock_OH_Sensor_DestroyInfos;
inline constexpr auto OH_Sensor_DestroySubscriptionAttribute = Mock_OH_Sensor_DestroySubscriptionAttribute;
inline constexpr auto OH_Sensor_DestroySubscriptionId = Mock_OH_Sensor_DestroySubscriptionId;
inline constexpr auto OH_Sensor_DestroySubscriber = Mock_OH_Sensor_DestroySubscriber;
inline constexpr auto OH_Sensor_CreateSubscriptionId = Mock_OH_Sensor_CreateSubscriptionId;
inline constexpr auto OH_SensorSubscriptionId_SetType = Mock_OH_SensorSubscriptionId_SetType;
inline constexpr auto OH_Sensor_CreateSubscriptionAttribute = Mock_OH_Sensor_CreateSubscriptionAttribute;
inline constexpr auto OH_SensorSubscriptionAttribute_SetSamplingInterval =
    Mock_OH_SensorSubscriptionAttribute_SetSamplingInterval;
inline constexpr auto OH_Sensor_CreateSubscriber = Mock_OH_Sensor_CreateSubscriber;
inline constexpr auto OH_SensorSubscriber_SetCallback = Mock_OH_SensorSubscriber_SetCallback;
inline constexpr auto OH_Sensor_Subscribe = Mock_OH_Sensor_Subscribe;
inline constexpr auto OH_Sensor_Unsubscribe = Mock_OH_Sensor_Unsubscribe;
} // namespace SensorSampleUnderTest
