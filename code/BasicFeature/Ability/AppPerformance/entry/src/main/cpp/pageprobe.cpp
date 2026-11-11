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

#include "napi/native_api.h"
#include <atomic>
#include <cerrno>
#include <cstdint>
#include <cstring>
#include <ctime>
#include <fcntl.h>
#include <sys/resource.h>
#include <string>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <vector>

namespace {
constexpr int64_t MAX_FILE_BYTES = 128LL * 1024 * 1024;
constexpr int64_t CALIBRATION_BYTES = 8LL * 1024 * 1024;
constexpr int64_t MILLISECONDS_PER_SECOND = 1000;
constexpr int64_t NANOSECONDS_PER_MILLISECOND = 1000000;
constexpr size_t MAX_PATH_BYTES = 4096;
constexpr size_t IO_BUFFER_BYTES = 65536;
constexpr uint32_t CHECKSUM_OFFSET_BASIS = 2166136261U;
constexpr uint32_t CHECKSUM_PRIME = 16777619U;
constexpr unsigned char CALIBRATION_FILL_BYTE = 0x5a;
constexpr mode_t PRIVATE_FILE_MODE = 0600;
constexpr uint64_t HEX_RADIX = 16;
constexpr char HEX_DIGITS[] = "0123456789abcdef";
constexpr uint64_t PAGEMAP_PRESENT_MASK = 1ULL << 63;
constexpr unsigned char RESIDENT_PAGE_MASK = 1U;

struct Probe {
    bool ok = false; // Operation/syscall success, NOT proof that residency is observable.
    bool residencyTrusted = false; // Conservative eligibility; same-run calibration is also required.
    std::string residencyTrustReason = "not-sampled";
    std::string operation;
    int errorCode = 0;
    std::string message;
    int64_t fileBytes = 0;
    int64_t pageBytes = 0;
    int64_t totalPages = 0;
    int64_t residentPages = 0; // Raw mincore vector count, even when untrusted.
    int64_t residentBytes = 0; // File CONTENT bytes covered by reported resident pages, not allocation.
    int64_t bytesRead = 0;
    uint32_t checksum = CHECKSUM_OFFSET_BASIS;
    std::string inode; // Legacy combined device:inode identifier.
    std::string deviceId;
    unsigned deviceMajor = 0;
    unsigned deviceMinor = 0;
    std::string inodeNumber; // Decimal strings avoid JS integer precision loss.
    std::string inodeHex;
    uid_t fileOwnerUid = 0;
    uid_t processUid = geteuid(); // Legacy field: effective UID.
    uid_t realUid = getuid();
    bool ownsFile = false;
    bool writeOpenAllowed = false;
    int writeOpenErrno = 0;
    bool ownerOrWritable = false; // Legacy compatibility, now uses an actual effective-UID open.
    int64_t sampleStartedMonotonicMs = 0;
    int64_t sampleCompletedMonotonicMs = 0;
    int64_t sampleWallTimeMs = 0;
    std::string kernelName;
    std::string kernelRelease;
};

struct Calibration {
    bool ok = false;
    bool passed = false;
    std::string path;
    std::string phase = "validate-private-directory";
    int errorCode = 0;
    std::string message;
    int64_t bytesWritten = 0;
    int fsyncReturnCode = -1;
    int fadviseReturnCode = -1;
    bool removed = false;
    int cleanupErrorCode = 0;
    Probe afterWrite;
    Probe afterDrop;
    Probe afterRead;
};

int64_t ClockMs(clockid_t id)
{
    struct timespec value {};
    return clock_gettime(id, &value) == 0 ?
        value.tv_sec * MILLISECONDS_PER_SECOND + value.tv_nsec / NANOSECONDS_PER_MILLISECOND : 0;
}

void Number(napi_env env, napi_value object, const char *key, double number)
{
    napi_value value;
    napi_create_double(env, number, &value);
    napi_set_named_property(env, object, key, value);
}

void Text(napi_env env, napi_value object, const char *key, const std::string &text)
{
    napi_value value;
    napi_create_string_utf8(env, text.c_str(), text.size(), &value);
    napi_set_named_property(env, object, key, value);
}

void Boolean(napi_env env, napi_value object, const char *key, bool flag)
{
    napi_value value;
    napi_get_boolean(env, flag, &value);
    napi_set_named_property(env, object, key, value);
}

napi_value Result(napi_env env, const Probe &probe)
{
    napi_value object;
    napi_create_object(env, &object);
    Boolean(env, object, "ok", probe.ok);
    Boolean(env, object, "residencyTrusted", probe.residencyTrusted);
    Text(env, object, "residencyTrustReason", probe.residencyTrustReason);
    Text(env, object, "operation", probe.operation);
    Number(env, object, "errorCode", probe.errorCode);
    Text(env, object, "message", probe.message);
    Number(env, object, "fileBytes", probe.fileBytes);
    Number(env, object, "pageBytes", probe.pageBytes);
    Number(env, object, "totalPages", probe.totalPages);
    Number(env, object, "residentPages", probe.residentPages);
    Number(env, object, "residentBytes", probe.residentBytes);
    Number(env, object, "residentContentBytes", probe.residentBytes);
    Text(env, object, "residentBytesMeaning",
        "file content bytes covered by raw reported resident pages; not physical allocation or reclaimed bytes");
    Number(env, object, "bytesRead", probe.bytesRead);
    Number(env, object, "checksum", probe.checksum);
    Text(env, object, "inode", probe.inode);
    Text(env, object, "deviceId", probe.deviceId);
    Number(env, object, "deviceMajor", probe.deviceMajor);
    Number(env, object, "deviceMinor", probe.deviceMinor);
    Text(env, object, "inodeNumber", probe.inodeNumber);
    Text(env, object, "inodeHex", probe.inodeHex);
    Number(env, object, "fileOwnerUid", probe.fileOwnerUid);
    Number(env, object, "processUid", probe.processUid);
    Number(env, object, "realUid", probe.realUid);
    Boolean(env, object, "ownsFile", probe.ownsFile);
    Boolean(env, object, "writeOpenAllowed", probe.writeOpenAllowed);
    Number(env, object, "writeOpenErrno", probe.writeOpenErrno);
    Boolean(env, object, "ownerOrWritable", probe.ownerOrWritable);
    Number(env, object, "sampleStartedMonotonicMs", probe.sampleStartedMonotonicMs);
    Number(env, object, "sampleCompletedMonotonicMs", probe.sampleCompletedMonotonicMs);
    Number(env, object, "sampleWallTimeMs", probe.sampleWallTimeMs);
    Text(env, object, "kernelName", probe.kernelName);
    Text(env, object, "kernelRelease", probe.kernelRelease);
    return object;
}

void Fail(Probe &probe, const char *operation)
{
    probe.errorCode = errno;
    probe.operation = operation;
    probe.message = std::string(operation) + ": " + std::strerror(errno);
}

bool ArgumentPath(napi_env env, napi_callback_info info, std::string &path)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t length = 0;
    if (argc != 1 || napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length) != napi_ok ||
        length == 0 || length > MAX_PATH_BYTES) {
        return false;
    }
    std::vector<char> buffer(length + 1);
    if (napi_get_value_string_utf8(env, argv[0], buffer.data(), buffer.size(), &length) != napi_ok) {
        return false;
    }
    path.assign(buffer.data(), length);
    return path.find('\0') == std::string::npos;
}

std::string UnsignedHex(uint64_t value)
{
    std::string text;
    do {
        text.insert(text.begin(), HEX_DIGITS[value % HEX_RADIX]);
        value /= HEX_RADIX;
    } while (value != 0);
    return text;
}

bool Metadata(int fd, Probe &probe)
{
    struct stat st {};
    if (fstat(fd, &st) != 0) {
        Fail(probe, "fstat");
        return false;
    }
    probe.fileBytes = st.st_size;
    probe.pageBytes = sysconf(_SC_PAGESIZE);
    probe.fileOwnerUid = st.st_uid;
    probe.deviceId = std::to_string(st.st_dev);
    probe.deviceMajor = major(st.st_dev);
    probe.deviceMinor = minor(st.st_dev);
    probe.inodeNumber = std::to_string(st.st_ino);
    probe.inodeHex = UnsignedHex(static_cast<unsigned long long>(st.st_ino));
    probe.inode = probe.deviceId + ":" + probe.inodeNumber;
    probe.ownsFile = st.st_uid == geteuid();
    struct utsname system {};
    if (uname(&system) == 0) {
        probe.kernelName = system.sysname;
        probe.kernelRelease = system.release;
    }
    if (!S_ISREG(st.st_mode) || st.st_size <= 0 || st.st_size > MAX_FILE_BYTES || probe.pageBytes <= 0) {
        errno = EINVAL;
        Fail(probe, "regular-file-size-or-page-size");
        return false;
    }
    probe.totalPages = (probe.fileBytes + probe.pageBytes - 1) / probe.pageBytes;
    return true;
}

void PermissionSignal(int fd, const std::string &path, Probe &probe)
{
    // This tests effective write OPEN access, without O_TRUNC or any write to the target.
    // It is NOT a claim about the exact mincore permission gate of a particular kernel.
    const int writable = open(path.c_str(), O_WRONLY | O_CLOEXEC);
    if (writable < 0) {
        probe.writeOpenErrno = errno;
    } else {
        struct stat original {};
        struct stat candidate {};
        if (fstat(fd, &original) != 0 || fstat(writable, &candidate) != 0) {
            probe.writeOpenErrno = errno;
        } else if (original.st_dev != candidate.st_dev || original.st_ino != candidate.st_ino) {
            probe.writeOpenErrno = ESTALE;
        } else {
            probe.writeOpenAllowed = true;
        }
        close(writable);
    }
    probe.ownerOrWritable = probe.ownsFile || probe.writeOpenAllowed;
}

bool ReadAll(int fd, Probe &probe)
{
    std::vector<unsigned char> buffer(IO_BUFFER_BYTES);
    while (probe.bytesRead < probe.fileBytes) {
        const int64_t remaining = probe.fileBytes - probe.bytesRead;
        const size_t requested = remaining < static_cast<int64_t>(buffer.size()) ?
            static_cast<size_t>(remaining) : buffer.size();
        const ssize_t count = pread(fd, buffer.data(), requested, probe.bytesRead);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            if (count == 0) {
                errno = EIO;
            }
            Fail(probe, "pread");
            return false;
        }
        for (ssize_t index = 0; index < count; ++index) {
            probe.checksum = (probe.checksum ^ buffer[index]) * CHECKSUM_PRIME;
        }
        probe.bytesRead += count;
    }
    return true;
}

void CountResidentPages(const std::vector<unsigned char> &resident, Probe &probe)
{
    for (int64_t index = 0; index < probe.totalPages; ++index) {
        if (resident[index] & RESIDENT_PAGE_MASK) {
            ++probe.residentPages;
            const int64_t remaining = probe.fileBytes - index * probe.pageBytes;
            probe.residentBytes += remaining < probe.pageBytes ? remaining : probe.pageBytes;
        }
    }
}

void SampleFd(int fd, Probe &probe)
{
    // No read/fault of the temporary PROT_NONE mapping. Clock boundaries enclose the raw sample.
    probe.sampleStartedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    probe.sampleWallTimeMs = ClockMs(CLOCK_REALTIME);
    void *mapping = mmap(nullptr, probe.fileBytes, PROT_NONE, MAP_SHARED, fd, 0);
    if (mapping == MAP_FAILED) {
        Fail(probe, "mmap");
    } else {
        std::vector<unsigned char> resident(static_cast<size_t>(probe.totalPages));
        if (mincore(mapping, probe.fileBytes, resident.data()) != 0) {
            Fail(probe, "mincore");
        } else {
            CountResidentPages(resident, probe);
            probe.ok = true;
            probe.residencyTrusted = probe.ownerOrWritable;
            probe.residencyTrustReason = probe.residencyTrusted ?
                "conservative-owner-or-effective-write-open; same-run calibration also required; "
                "kernel gate not proven" :
                "no-owner-or-effective-write-open; residency unobserved, not zero eviction; kernel gate unknown";
            probe.message = "Raw file-page residency vector; not process RSS or API reclaimed quantity";
        }
        munmap(mapping, probe.fileBytes);
    }
    probe.sampleCompletedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
}

Probe ProbePath(const std::string &path, bool warm)
{
    Probe probe;
    probe.operation = warm ? "pread-all-bytes+mincore" : "mincore";
    const int fd = open(path.c_str(), O_RDONLY | O_CLOEXEC);
    if (fd < 0) {
        Fail(probe, "open-read");
        return probe;
    }
    if (Metadata(fd, probe)) {
        PermissionSignal(fd, path, probe);
        if (!warm || ReadAll(fd, probe)) {
            SampleFd(fd, probe);
        }
    }
    close(fd);
    return probe;
}

napi_value Measure(napi_env env, napi_callback_info info, bool warm)
{
    std::string path;
    if (!ArgumentPath(env, info, path)) {
        Probe probe;
        probe.operation = "argument";
        probe.errorCode = EINVAL;
        probe.message = "Expected one nonempty path without embedded NUL";
        return Result(env, probe);
    }
    return Result(env, ProbePath(path, warm));
}

Probe CalibrationSample(int fd, bool warm)
{
    Probe probe;
    probe.operation = warm ? "calibration-pread+mincore" : "calibration-mincore";
    if (Metadata(fd, probe)) {
        probe.writeOpenAllowed = true; // This very fd was created O_RDWR, not an access() guess.
        probe.ownerOrWritable = probe.ownsFile || probe.writeOpenAllowed;
        if (!warm || ReadAll(fd, probe)) {
            SampleFd(fd, probe);
        }
    }
    return probe;
}

bool ValidateCalibrationDirectory(int dir, Calibration &result)
{
    struct stat directoryStat {};
    if (fstat(dir, &directoryStat) != 0) {
        result.phase = "fstat-private-directory";
        result.errorCode = errno;
        result.message = std::strerror(errno);
        return false;
    }
    if (directoryStat.st_uid != geteuid() || (directoryStat.st_mode & S_IWOTH) != 0) {
        result.errorCode = EACCES;
        result.message = "Calibration requires an app-owned non-world-writable private directory";
        return false;
    }
    return true;
}

std::string CalibrationName()
{
    static std::atomic<uint64_t> serial {0};
    return ".pageprobe-calibration-" + std::to_string(getpid()) + "-" +
        std::to_string(ClockMs(CLOCK_MONOTONIC)) + "-" + std::to_string(++serial) + ".bin";
}

void WriteCalibrationFile(int fd, bool identified, const std::vector<unsigned char> &buffer, Calibration &result)
{
    if (identified) {
        result.phase = "write-new-private-file";
    }
    while (identified && result.bytesWritten < CALIBRATION_BYTES) {
        const int64_t remaining = CALIBRATION_BYTES - result.bytesWritten;
        const size_t requested = remaining < static_cast<int64_t>(buffer.size()) ?
            static_cast<size_t>(remaining) : buffer.size();
        const ssize_t count = write(fd, buffer.data(), requested);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            result.errorCode = count == 0 ? EIO : errno;
            break;
        }
        result.bytesWritten += count;
    }
}

bool CalibrationPassed(const Calibration &result)
{
    return result.ok && result.afterWrite.residencyTrusted && result.afterDrop.residencyTrusted &&
        result.afterRead.residencyTrusted && result.afterRead.bytesRead == CALIBRATION_BYTES &&
        result.afterWrite.residentPages == result.afterWrite.totalPages &&
        result.afterDrop.residentPages < result.afterWrite.residentPages &&
        result.afterRead.residentPages == result.afterRead.totalPages;
}

void CompleteCalibration(int fd, Calibration &result)
{
    if (result.errorCode == 0) {
        result.phase = "fsync-new-private-file";
        result.fsyncReturnCode = fsync(fd);
        if (result.fsyncReturnCode != 0) {
            result.errorCode = errno;
        }
    }
    if (result.errorCode == 0) {
        result.afterWrite = CalibrationSample(fd, false);
        result.phase = "fadvise-ONLY-new-private-file";
        result.fadviseReturnCode = posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
        // posix_fadvise returns its error code directly, not via errno.
        if (result.fadviseReturnCode != 0) {
            result.errorCode = result.fadviseReturnCode;
        }
        result.afterDrop = CalibrationSample(fd, false);
        result.afterRead = CalibrationSample(fd, true);
        result.ok = result.errorCode == 0 && result.afterWrite.ok && result.afterDrop.ok && result.afterRead.ok;
        result.passed = CalibrationPassed(result);
        result.message = result.passed ? "Cold/warm responsiveness observed ONLY on this new private inode" :
            "Private-file calibration not established; no inference of HAP observability or zero reclamation";
        result.phase = "completed";
    } else {
        result.message = std::strerror(result.errorCode);
    }
}

void RemoveCalibrationFile(int dir, const std::string &name, const struct stat &created,
    bool identified, Calibration &result)
{
    // Remove only the new inode we created, never a replaced pathname or an installed target.
    struct stat cleanup {};
    if (identified && fstatat(dir, name.c_str(), &cleanup, AT_SYMLINK_NOFOLLOW) == 0 &&
        cleanup.st_dev == created.st_dev && cleanup.st_ino == created.st_ino) {
        result.removed = unlinkat(dir, name.c_str(), 0) == 0;
        if (!result.removed) {
            result.cleanupErrorCode = errno;
        }
    } else {
        result.cleanupErrorCode = ESTALE;
    }
}

Calibration Calibrate(const std::string &directory)
{
    Calibration result;
    const int dir = open(directory.c_str(), O_RDONLY | O_DIRECTORY | O_CLOEXEC);
    if (dir < 0) {
        result.errorCode = errno;
        result.message = std::strerror(errno);
        return result;
    }
    if (!ValidateCalibrationDirectory(dir, result)) {
        close(dir);
        return result;
    }
    const std::string name = CalibrationName();
    result.path = directory + "/" + name;
    result.phase = "create-new-private-file";
    // Never accept an existing inode. All write/fsync/fadvise operations below use ONLY this new fd.
    const int fd = openat(dir, name.c_str(), O_CREAT | O_EXCL | O_RDWR | O_CLOEXEC | O_NOFOLLOW, PRIVATE_FILE_MODE);
    if (fd < 0) {
        result.errorCode = errno;
        result.message = std::strerror(errno);
        close(dir);
        return result;
    }
    struct stat created {};
    result.phase = "identify-new-private-file";
    const bool identified = fstat(fd, &created) == 0;
    if (!identified) {
        result.errorCode = errno;
    }
    std::vector<unsigned char> buffer(IO_BUFFER_BYTES, CALIBRATION_FILL_BYTE);
    WriteCalibrationFile(fd, identified, buffer, result);
    CompleteCalibration(fd, result);
    RemoveCalibrationFile(dir, name, created, identified, result);
    close(fd);
    close(dir);
    return result;
}

napi_value CalibratePrivate(napi_env env, napi_callback_info info)
{
    std::string directory;
    Calibration calibration;
    if (!ArgumentPath(env, info, directory)) {
        calibration.errorCode = EINVAL;
        calibration.message = "Expected one app-private directory path";
    } else {
        calibration = Calibrate(directory);
    }
    napi_value object;
    napi_create_object(env, &object);
    Boolean(env, object, "ok", calibration.ok);
    Boolean(env, object, "passed", calibration.passed);
    Text(env, object, "path", calibration.path);
    Text(env, object, "phase", calibration.phase);
    Number(env, object, "errorCode", calibration.errorCode);
    Text(env, object, "message", calibration.message);
    Number(env, object, "bytesWritten", calibration.bytesWritten);
    Number(env, object, "fsyncReturnCode", calibration.fsyncReturnCode);
    Number(env, object, "fadviseReturnCode", calibration.fadviseReturnCode);
    Boolean(env, object, "removed", calibration.removed);
    Number(env, object, "cleanupErrorCode", calibration.cleanupErrorCode);
    napi_set_named_property(env, object, "afterWrite", Result(env, calibration.afterWrite));
    napi_set_named_property(env, object, "afterDrop", Result(env, calibration.afterDrop));
    napi_set_named_property(env, object, "afterRead", Result(env, calibration.afterRead));
    return object;
}

// A single held, genuinely readable private HAP mapping. Only the REAL SDK may advise it.
struct HeldMapping {
    int fd = -1;
    void *address = MAP_FAILED;
    size_t length = 0;
    uint32_t handle = 0;
    bool pagemapEstablished = false;
    Probe identity;
};
HeldMapping g_held;
std::atomic<uint32_t> g_nextMappingHandle {0};

std::string AddressHex(uintptr_t address)
{
    return UnsignedHex(static_cast<unsigned long long>(address));
}

bool MappingHandle(napi_env env, napi_callback_info info, uint32_t &value)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    return argc == 1 && napi_get_value_uint32(env, argv[0], &value) == napi_ok && value != 0;
}

void NullableNumber(napi_env env, napi_value object, const char *key, bool valid, double value)
{
    if (valid) {
        Number(env, object, key, value);
        return;
    }
    napi_value nullValue;
    napi_get_null(env, &nullValue);
    napi_set_named_property(env, object, key, nullValue);
}

void MappingHeader(napi_env env, napi_value object, uint32_t handle, bool active, bool valid, const Probe &file)
{
    Boolean(env, object, "ok", valid);
    Number(env, object, "handle", active ? handle : 0);
    Number(env, object, "errorCode", active ? file.errorCode : ESTALE);
    Text(env, object, "message", valid ? "Held PROT_READ MAP_PRIVATE mapping; not global pagecache quantity" :
        (active ? file.message : "No matching live mapping handle"));
    Number(env, object, "mappedBytes", active ? g_held.length : 0);
    Text(env, object, "virtualStart", active ? AddressHex(reinterpret_cast<uintptr_t>(g_held.address)) : "");
    Text(env, object, "virtualEnd",
        active ? AddressHex(reinterpret_cast<uintptr_t>(g_held.address) + g_held.length) : "");
}

void MappingFdPath(napi_env env, napi_value object, bool active)
{
    std::string fdPath;
    int linkError = 0;
    if (active) {
        char path[MAX_PATH_BYTES + 1];
        const ssize_t count = readlink(("/proc/self/fd/" + std::to_string(g_held.fd)).c_str(), path, sizeof(path) - 1);
        if (count >= 0) {
            fdPath.assign(path, count);
        } else {
            linkError = errno;
        }
    }
    Text(env, object, "fdPath", fdPath);
    Number(env, object, "fdPathErrorCode", linkError);
}

void TouchMapping(napi_env env, napi_value object, const Probe &file, bool shouldTouch,
    int64_t &touched, uint32_t &checksum)
{
    struct rusage faultsBefore {};
    struct rusage faultsAfter {};
    int faultScope = RUSAGE_SELF;
#ifdef RUSAGE_THREAD
    faultScope = RUSAGE_THREAD;
#endif
    bool faultsKnown = false;
    if (shouldTouch) {
        faultsKnown = getrusage(faultScope, &faultsBefore) == 0;
        const volatile unsigned char *bytes = static_cast<const volatile unsigned char *>(g_held.address);
        // Read EVERY file byte via the held mapping. This populates its PTEs, unlike pread().
        for (int64_t index = 0; index < file.fileBytes; ++index) {
            checksum = (checksum ^ bytes[index]) * CHECKSUM_PRIME;
        }
        touched = file.fileBytes;
        faultsKnown = getrusage(faultScope, &faultsAfter) == 0 && faultsKnown;
    }
    Number(env, object, "bytesTouched", touched);
    Number(env, object, "checksum", checksum);
    Text(env, object, "faultScope", faultScope == RUSAGE_SELF ?
        "process-during-synchronous-touch" : "thread-during-synchronous-touch");
    Boolean(env, object, "faultCountersAvailable", faultsKnown);
    NullableNumber(env, object, "minorFaults", faultsKnown, faultsAfter.ru_minflt - faultsBefore.ru_minflt);
    NullableNumber(env, object, "majorFaults", faultsKnown, faultsAfter.ru_majflt - faultsBefore.ru_majflt);
}

struct PagemapSample {
    int errorCode = 0;
    int64_t present = 0;
    bool readable = false;
};

bool ReadPagemapEntry(int pagemap, uint64_t page, uint64_t &entry, int &errorCode)
{
    ssize_t count;
    do {
        count = pread(pagemap, &entry, sizeof(entry), page * sizeof(entry));
    } while (count < 0 && errno == EINTR);
    if (count != sizeof(entry)) {
        errorCode = count < 0 ? errno : EIO;
        return false;
    }
    return true;
}

void ReadPresentPages(const Probe &file, PagemapSample &sample)
{
    const int pagemap = open("/proc/self/pagemap", O_RDONLY | O_CLOEXEC);
    if (pagemap < 0) {
        sample.errorCode = errno;
        return;
    }
    const uint64_t firstPage = reinterpret_cast<uintptr_t>(g_held.address) / file.pageBytes;
    sample.readable = true;
    for (int64_t index = 0; index < file.totalPages; ++index) {
        uint64_t entry = 0;
        if (!ReadPagemapEntry(pagemap, firstPage + index, entry, sample.errorCode)) {
            sample.readable = false;
            break;
        }
        // Only PRESENT is used/exported, never PFNs or physical addresses.
        if (entry & PAGEMAP_PRESENT_MASK) {
            ++sample.present;
        }
    }
    close(pagemap);
}

void SampleHeldResidency(Probe &file)
{
    file.ownerOrWritable = g_held.identity.ownerOrWritable;
    file.ownsFile = g_held.identity.ownsFile;
    file.writeOpenAllowed = g_held.identity.writeOpenAllowed;
    file.writeOpenErrno = g_held.identity.writeOpenErrno;
    file.operation = "held-mapping-mincore";
    std::vector<unsigned char> resident(static_cast<size_t>(file.totalPages));
    if (mincore(g_held.address, file.fileBytes, resident.data()) == 0) {
        file.ok = true;
        CountResidentPages(resident, file);
        file.residencyTrusted = file.ownerOrWritable;
        file.residencyTrustReason = "legacy mincore raw cache signal; independent of held-mapping PRESENT bits";
    } else {
        Fail(file, "held-mapping-mincore");
    }
}

void MappingPagemap(napi_env env, napi_value object, bool valid, const PagemapSample &sample)
{
    Boolean(env, object, "pagemapReadable", sample.readable);
    Boolean(env, object, "pagemapEstablished", valid && g_held.pagemapEstablished);
    Number(env, object, "pagemapErrorCode", sample.errorCode);
    Text(env, object, "pagemapMeaning",
        "PRESENT PTE count for ONLY virtualStart..virtualEnd; not global filecache or physical memory returned");
    NullableNumber(env, object, "rawPresentPages", sample.readable, sample.present);
    NullableNumber(env, object, "presentPages", valid && sample.readable && g_held.pagemapEstablished, sample.present);
}

napi_value MappingObservation(napi_env env, uint32_t handle, bool touch)
{
    napi_value object;
    napi_create_object(env, &object);
    const bool active = g_held.fd >= 0 && g_held.address != MAP_FAILED && g_held.handle == handle;
    Probe file;
    bool valid = active && Metadata(g_held.fd, file);
    if (valid && (file.inode != g_held.identity.inode || file.fileBytes != g_held.identity.fileBytes)) {
        valid = false;
        file.errorCode = ESTALE;
        file.message = "Held file identity or length changed";
    }
    MappingHeader(env, object, handle, active, valid, file);
    MappingFdPath(env, object, active);
    int64_t touched = 0;
    uint32_t checksum = CHECKSUM_OFFSET_BASIS;
    TouchMapping(env, object, file, valid && touch, touched, checksum);
    PagemapSample sample;
    file.sampleStartedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    file.sampleWallTimeMs = ClockMs(CLOCK_REALTIME);
    if (valid) {
        ReadPresentPages(file, sample);
        if (touch && sample.readable && sample.present == file.totalPages) {
            g_held.pagemapEstablished = true;
        }
        SampleHeldResidency(file);
    }
    file.bytesRead = touched;
    file.checksum = checksum;
    file.sampleCompletedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    MappingPagemap(env, object, valid, sample);
    napi_set_named_property(env, object, "file", Result(env, file));
    return object;
}

napi_value BeginMapping(napi_env env, napi_callback_info info)
{
    std::string path;
    if (g_held.fd >= 0 || !ArgumentPath(env, info, path)) {
        napi_throw_error(env, nullptr, "Mapping already active or invalid target path");
        return nullptr;
    }
    const int fd = open(path.c_str(), O_RDONLY | O_CLOEXEC);
    Probe identity;
    if (fd < 0 || !Metadata(fd, identity)) {
        if (fd >= 0) {
            close(fd);
        }
        napi_throw_error(env, nullptr, "Cannot open/stat held mapping target");
        return nullptr;
    }
    PermissionSignal(fd, path, identity);
    const size_t length = static_cast<size_t>(identity.totalPages * identity.pageBytes);
    void *address = mmap(nullptr, length, PROT_READ, MAP_PRIVATE, fd, 0);
    if (address == MAP_FAILED) {
        close(fd);
        napi_throw_error(env, nullptr, "PROT_READ MAP_PRIVATE mmap failed");
        return nullptr;
    }
    g_held.fd = fd;
    g_held.address = address;
    g_held.length = length;
    g_held.handle = ++g_nextMappingHandle;
    g_held.pagemapEstablished = false;
    g_held.identity = identity;
    return MappingObservation(env, g_held.handle, true);
}

napi_value SampleMapping(napi_env env, napi_callback_info info)
{
    uint32_t handle = 0;
    MappingHandle(env, info, handle);
    return MappingObservation(env, handle, false);
}

napi_value RereadMapping(napi_env env, napi_callback_info info)
{
    uint32_t handle = 0;
    MappingHandle(env, info, handle);
    return MappingObservation(env, handle, true);
}

napi_value ReleaseMapping(napi_env env, napi_callback_info info)
{
    uint32_t handle = 0;
    const bool active = MappingHandle(env, info, handle) && g_held.fd >= 0 && g_held.handle == handle;
    bool released = false;
    if (active) {
        released = munmap(g_held.address, g_held.length) == 0;
        close(g_held.fd);
        g_held = HeldMapping();
    }
    napi_value result;
    napi_get_boolean(env, released, &result);
    return result;
}

napi_value Warm(napi_env env, napi_callback_info info) { return Measure(env, info, true); }
napi_value Sample(napi_env env, napi_callback_info info) { return Measure(env, info, false); }

napi_value Init(napi_env env, napi_value exports)
{
    const napi_property_descriptor descriptors[] = {
        {"warmFile", nullptr, Warm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sampleFile", nullptr, Sample, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"calibratePrivateFile", nullptr, CalibratePrivate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"beginMappedFile", nullptr, BeginMapping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sampleMappedFile", nullptr, SampleMapping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rereadMappedFile", nullptr, RereadMapping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseMappedFile", nullptr, ReleaseMapping, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(descriptors) / sizeof(descriptors[0]), descriptors);
    return exports;
}

napi_module g_module = {1, 0, nullptr, Init, "pageprobe", nullptr, {0}};
__attribute__((constructor)) void Register() { napi_module_register(&g_module); }
} // namespace
