part of nice_hooks;

List<String>? agentList;

List<String>? getAgentList(String region) {
  if (region == "Central 1") {
    agentList = [
      "Ronam international Ltd CBD",
      "Ronam international Ltd Entebe",
      "Ronam international Ltd Natete",
      "Nvuma Shoppers"
    ];
  } else if (region == "Central 2") {
    agentList = [
      "Vesom",
      "Vesom Luweero",
      "Equipcare",
      "Equipcare Kayunga",
      "Mutegyeki",
      "Seaford",
      "Testing Agent",
    ];
  } else if (region == "South West") {
    agentList = [
      "Gumisiriza tarasisio",
      "Muwonge enterprises",
      "Amon Mugizi",
      // "Mutundagye enterprises",
      "Ahimbisibwe Livingstone",
      "Adriano tumushabe",
      "Antherbeth enterprises",
      "Divine interiors/mbaine ronald",
      "Edith nzamponimpa karyeija",
      "Wesak Holdings",
      "Ndugga Lubwama limited",
      "Gumisiriza Kabwohe",
    ];
  } else if (region == "North") {
    agentList = [
      // "Odong Leo Investments",
      "Inde Foundation",
      // "Royal Crane Resort",
      "MeWa Ducu",
      "Mewa Ducu - Kitgum",
      "DokolonCheap Stores",
      "Yogibapa Inv Ltd",
      "Karepekuri Distributors",
    ];
  } else if (region == "East") {
    agentList = [
      "Kikib Investments Jinja",
      "Zam Nakyeyune Jinja",
      "Joseph Tumwesigye Kamuli",
      "Namwagale Betty Iganga",
      "Anna Maria Bugiri",
      // "Orono Yowasi Tororo",
      "Manjiya Agencies Mbale",
      "Dhrasti Enterprises Mbale",
      "Downtown Bookshop Mbale",
      "Goodwill Shopping Center Kumi",
      "Goalman Soroti",
      "Seven Eagles Investments Soroti",
      "Hinganda Enterprises Ltd"
    ];
  } else if (region == "West Nile") {
    agentList = [
      "Jan Mohammed",
      // "Grace Owacha",
      // "Kaiga Magila Investment",
      // "Ligiri Nelson",
      "Hellen Chandiru",
      "Smile Distributor Ltd",
      "Venjix Technologies Limited",
      "Joken Cash Ltd",
      "Kyomu Investments Ltd",
    ];
  } else if (region == "Mid West") {
    agentList = [
      "Blue Nile FortPortal",
      "Blue Nile Kasese",
      "Kate Tusiime",
      "Goddet Rwimi",
      "Kjambo Commodities",
      "Sawan Distributors Limited",
      "Contact Telecom",
      "Gevas Enterprises",
      "Kate Tusiime",
    ];
  } else if (region == "Supermarkets") {
    agentList = ["Factory Outlet"];
  } else if (region == "all") {
    agentList = [
      "Ronam international Ltd CBD",
      "Ronam international Ltd Entebe",
      "Ronam international Ltd Natete",
      "Vesom",
      "Vesom Luweero",
      "Equipcare",
      "Equipcare Kayunga",
      "Mutegyeki",
      "Seaford",
      "Testing Agent",
      "Gumisiriza tarasisio",
      "Muwonge enterprises",
      "Amon Mugizi",
      // "Mutundagye enterprises",
      "Ahimbisibwe Livingstone",
      "Adriano tumushabe",
      "Antherbeth enterprises",
      "Divine interiors/mbaine ronald",
      "Edith nzamponimpa karyeija",
      "Wesak Holdings",
      "Ndugga Lubwama limited",
      "Gumisiriza Kabwohe",
      // "Odong Leo Investments",
      "Inde Foundation",
      // "Royal Crane Resort",
      "MeWa Ducu",
      "Mewa Ducu - Kitgum",
      "DokolonCheap Stores",
      "Yogibapa Inv Ltd",
      "Karepekuri Distributors",
      "Kikib Investments Jinja",
      "Zam Nakyeyune Jinja",
      "Joseph Tumwesigye Kamuli",
      "Namwagale Betty Iganga",
      "Anna Maria Bugiri",
      // "Orono Yowasi Tororo",
      "Manjiya Agencies Mbale",
      "Dhrasti Enterprises Mbale",
      "Downtown Bookshop Mbale",
      "Goodwill Shopping Center Kumi",
      "Goalman Soroti",
      "Seven Eagles Investments Soroti",
      "Hinganda Enterprises Ltd",
      "Jan Mohammed",
      // "Grace Owacha",
      // "Kaiga Magila Investment",
      // "Ligiri Nelson",
      "Hellen Chandiru",
      "Smile Distributor Ltd",
      "Venjix Technologies Limited",
      "Joken Cash Ltd",
      "Kyomu Investments Ltd",
      "Blue Nile FortPortal",
      "Blue Nile Kasese",
      "Kate Tusiime",
      "Goddet Rwimi",
      "Kjambo Commodities",
      "Sawan Distributors Limited",
      "Contact Telecom",
      "Gevas Enterprises",
      "Kate Tusiime",
    ];
  }
  return agentList;
}
