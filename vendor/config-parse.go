package main

import (
    "fmt"
    "gopkg.in/yaml.v2"
    "io/ioutil"
    "os"
)

type AEConfigStruct struct {
	Author string `json:"author"`
	Config struct {
		AddRepo struct {
			Docker      bool `json:"docker"`
			Google      bool `json:"google"`
			Googlecloud bool `json:"googlecloud"`
			Insync      bool `json:"insync"`
			Kubernetes  bool `json:"kubernetes"`
			Mendeley    bool `json:"mendeley"`
			Signal      bool `json:"signal"`
			Skype       bool `json:"skype"`
			Spotify     bool `json:"spotify"`
			Vscode      bool `json:"vscode"`
			Winehq      bool `json:"winehq"`
		} `json:"add_repo"`
		Flags struct {
			AutoYes      bool `json:"auto_yes"`
			PreserveDebs bool `json:"preserve_debs"`
			PurgeEnabled bool `json:"purge_enabled"`
		} `json:"flags"`
		Install struct {
			Apt struct {
				Administration []string `json:"administration"`
				Development    []string `json:"development"`
				External       []string `json:"external"`
				Multimedia     []string `json:"multimedia"`
				Other          []string `json:"other"`
				Productivity   []string `json:"productivity"`
				Security       []string `json:"security"`
			} `json:"apt"`
			DebianPackages []string `json:"debian_packages"`
			Python2        []string `json:"python2"`
			Python3        []string `json:"python3"`
		} `json:"install"`
		Ppa   []string `json:"ppa"`
		Purge []string `json:"purge"`
		Tasks struct {
			Apt     bool `json:"apt"`
			Debs    bool `json:"debs"`
			Pip2    bool `json:"pip2"`
			Pip3    bool `json:"pip3"`
			Ppa     bool `json:"ppa"`
			Purge   bool `json:"purge"`
			Repo    bool `json:"repo"`
			Update  bool `json:"update"`
			Upgrade bool `json:"upgrade"`
		} `json:"tasks"`
	} `json:"config"`
	Name    string `json:"name"`
	Version int    `json:"version"`
}

func main() {
    filename := os.Args[1]
    var config AEConfigStruct
    source, err := ioutil.ReadFile(filename)
    if err != nil {
        panic(err)
    }
    err = yaml.Unmarshal(source, &config)
    if err != nil {
        panic(err)
    }
    fmt.Printf("Value: %#v\n", config.Name[0])
    fmt
}
