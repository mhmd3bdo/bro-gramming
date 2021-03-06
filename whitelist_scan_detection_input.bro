# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Contributor(s):
# Michal Purzynski mpurzynski@mozilla.com
#
# Script to read in a list of IP addresses that will be whitelisted from scan detection (ignore as a source of a scan).
#

module Scan;

type Idx: record {
    whitelist_ip: subnet;
};

global whitelist_scan_ip: set[subnet] = {} &synchronized;

event bro_init()
{
    Input::add_table([$source="/etc/bro/scripts/brozilla/whitelist_scan_ip.txt",
            $name="whitelist_scan_ip",
            $idx=Idx,
            $destination=whitelist_scan_ip,
            $mode=Input::REREAD]);
}
