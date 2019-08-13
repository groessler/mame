-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

---------------------------------------------------------------------------
--
--   m20.lua
--
--   Small makefile for Olivetti M20 and other Z8000 based systems
--   Use make SUBTARGET=m20 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in m20.lst.
--------------------------------------------------

CPUS["Z8000"] = true
CPUS["Z8001"] = true
CPUS["I86"] = true
CPUS["IE15"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in m20.lst.
--------------------------------------------------

SOUNDS["BEEP"] = true
-- SOUNDS["SAMPLES"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["MC6845"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["WD_FDC"] = true
MACHINES["FDC_PLL"] = true
MACHINES["UPD765"] = true
MACHINES["IE15"] = true
MACHINES["I8251"] = true
MACHINES["PIT8253"] = true
MACHINES["I8255"] = true
MACHINES["PIC8259"] = true


--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

BUSES["RS232"] = true
BUSES["SUNKBD"] = true
-- BUSES["CENTRONICS"] = true


--------------------------------------------------
-- specify used file formats
--------------------------------------------------

FORMATS["PC_DSK"] = true
FORMATS["M20_DSK"] = true
FORMATS["UPD765_DSK"] = true
FORMATS["BASICDSK"] = true


--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in m20.lst
--------------------------------------------------

function createProjects_mame_m20(_target, _subtarget)
	project ("mame_m20")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-m20"))
	addprojectflags()
	precompiledheaders()

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

files{
--	MAME_DIR .. "src/mame/drivers/polepos.cpp",
	MAME_DIR .. "src/mame/drivers/m20.cpp",
	MAME_DIR .. "src/mame/machine/m20_8086.cpp",
	MAME_DIR .. "src/mame/machine/m20_kbd.cpp",
	MAME_DIR .. "src/mame/drivers/ie15.cpp",
}
end

function linkProjects_mame_m20(_target, _subtarget)
	links {
		"mame_m20",
	}
end
