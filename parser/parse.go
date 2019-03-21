package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"strings"

	"gopkg.in/yaml.v2"
)

// AEConfigStruct ... Define Config Structure
type AEConfigStruct struct {
	Author string `json:"author"`
	Config struct {
		AddRepo struct {
			Docker      bool `json:"docker,omitempty"`
			Google      bool `json:"google,omitempty"`
			Googlecloud bool `json:"googlecloud,omitempty"`
			Insync      bool `json:"insync,omitempty"`
			Kubernetes  bool `json:"kubernetes,omitempty"`
			Mendeley    bool `json:"mendeley,omitempty"`
			Signal      bool `json:"signal,omitempty"`
			Skype       bool `json:"skype,omitempty"`
			Spotify     bool `json:"spotify,omitempty"`
			Vscode      bool `json:"vscode,omitempty"`
			Winehq      bool `json:"winehq,omitempty"`
		} `json:"add_repo,omitempty"`
		Flags struct {
			AutoYes      bool `json:"auto_yes"`
			PreserveDebs bool `json:"preserve_debs,omitempty"`
			PurgeEnabled bool `json:"purge_enabled,omitempty"`
		} `json:"flags"`
		Install struct {
			Apt struct {
				Administration []string `json:"administration,omitempty"`
				Development    []string `json:"development,omitempty"`
				Multimedia     []string `json:"multimedia,omitempty"`
				External       []string `json:"external,omitempty"`
				Other          []string `json:"other,omitempty"`
				Productivity   []string `json:"productivity,omitempty"`
				Security       []string `json:"security,omitempty"`
			} `json:"apt,omitempty"`
			DebianPackages []string `json:"debian_packages,omitempty"`
			Python2        []string `json:"python2,omitempty"`
			Python3        []string `json:"python3,omitempty"`
			Conda					 []string `json:"conda,omitempty`
		} `json:"install,omitempty"`
		Ppa   []string `json:"ppa,omitempty"`
		Purge []string `json:"purge,omitempty"`
		Tasks struct {
			Apt     bool `json:"apt,omitempty"`
			Conda   bool `json:"conda,omitempty"`
			Debs    bool `json:"debs,omitempty"`
			Pip2    bool `json:"pip2,omitempty"`
			Pip3    bool `json:"pip3,omitempty"`
			Ppa     bool `json:"ppa,omitempty"`
			Purge   bool `json:"purge,omitempty"`
			Repo    bool `json:"repo,omitempty"`
			Update  bool `json:"update,omitempty"`
			Upgrade bool `json:"upgrade,omitempty"`
		} `json:"tasks"`
	} `json:"config"`
	Name    string `json:"name"`
	Version int    `json:"version"`
}

// VersionSruct ...  Version info Structure
type VersionSruct struct {
	API   int `json:"api"`
	Stats struct {
		Node   string `json:"node,omitempty"`
		Report bool   `json:"report,omitempty"`
	} `json:"stats,omitempty"`
	Version struct {
		Name   string `json:"name"`
		Number int    `json:"number"`
	} `json:"version"`
}

func main() {

	flag.Usage = func() {
		fmt.Printf("Usage:")
		fmt.Printf("cfg-parse -type <config/version> -file <file.yml>\n")
		fmt.Printf("----------------\n")
		fmt.Printf("-file  <File to parse> Default is config.yml\n")
		fmt.Printf("-t     Config type to parse it can be either config or version.\n")
		fmt.Printf("-v     Version of the Parser")
		fmt.Printf("-h     Display this message\n")
		fmt.Printf("----------------\n")
	}
	var (
		filename string
		filetype string
		// VERSION indicates which version of the binary is running.
		VERSION = "0.1.0"

		// GITCOMMIT indicates which git hash the binary was built off of
		GITCOMMIT string
		vrsn      bool
		tmpret    []byte
	)
	flag.StringVar(&filename, "f", "config.yml", "Specify YAML file to use. Defaults to config.yml in current directory.\n")
	flag.StringVar(&filetype, "t", "config", "Type of config file to parse.\n")
	flag.BoolVar(&vrsn, "v", false, "Display Version of the parser\n")
	flag.Parse()
	// get git commit
	tmpret, err := exec.Command("git", "rev-parse", "--short", "HEAD").Output()
	if err != nil {
		panic(err)
	}
	GITCOMMIT = string(tmpret)

	if vrsn {
		fmt.Printf("Parser Version : %10s\nBuilt from commit : %10s\n", VERSION, GITCOMMIT)
		return
	}

	//deal with it

	//Check filename is present
	if len(filename) == 0 {
		fmt.Printf("Error! Filename cannot be Empty\n")
		flag.Usage()
		os.Exit(1)
	}
	//If flagtype is empty error, change input to lowercase if not empty.
	if len(filetype) != 0 {
		filetype = strings.ToLower(filename)
	} else {
		fmt.Printf("Error! Type argument cannot be empty!\n")
		flag.Usage()
		os.Exit(1)
	}

	//check filetype
	switch filetype {
	case "config":
		parseConfig(filename)
	case "version":
		parseVersion(filename)
	default:
		fmt.Printf("Error! Not a valid config type.\n")
		flag.Usage()
		os.Exit(1)

	}

}

func parseConfig(filename string) {
	var c AEConfigStruct
	source, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}
	err = yaml.Unmarshal(source, &c)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Value: %q\n", c.Author)
}

func parseVersion(filename string) {
	var v VersionSruct
	source, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}
	err = yaml.Unmarshal(source, &v)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Value: %q\n", v.Version.Name)
}

//CheckBool ... Function to check if boolean is present
func CheckBool(booltocheck bool, varname string, defaultvalue bool) {
	fmt.Printf("WIP\n")
}

//CheckNotEmpty ... Function to check if config is not empty
func CheckNotEmpty() {
	fmt.Printf("WIP\n")
}

//CheckIfInteger ... Function to check if value is int
func CheckIfInteger() {
	fmt.Printf("WIP\n")
}
