const registerUser = () => {
  let user = document.getElementById("user_profile");
  const expertForm = document.getElementById("form_experts");
  const servantForm = document.getElementById("form_servants");
  if (user) {
    user.addEventListener("change", e => {
      if (e.currentTarget.value !== "") {
        if (e.currentTarget.value === "1") {
          expertForm.classList.remove("hide");
          servantForm.classList.add("hide");
        }
        else {
          servantForm.classList.remove("hide");
          expertForm.classList.add("hide");
        }
      }
      else {
        servantForm.classList.add("hide");
        expertForm.classList.add("hide");
      }
    });
  }
};

export {registerUser};